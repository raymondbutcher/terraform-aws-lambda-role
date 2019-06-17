import itertools

from pretf.api import block
from pretf.test import SimpleTest
from pretf.workflow import delete_files

DEAD_LETTER_CONFIG = {"target_arn": "arn:aws:sqs:us-east-1:123456789012:queue1"}

VPC_CONFIG = {"security_group_ids": ["sg-11111111"], "subnet_ids": ["subnet-4204d234"]}


class TestCombinations(SimpleTest):
    def test_init(self):
        delete_files("*.json")
        self.init()

    def test_create(self):

        # Prepare 2 possible options for each input variable,
        # using the variable and not using the variable.
        cloudwatch_logs_options = [False, True]
        custom_policies_options = [[], ["${data.aws_iam_policy_document.custom.json}"]]
        dead_letter_config_options = [None, DEAD_LETTER_CONFIG]
        policy_arns_options = [[], ["arn:aws:iam::aws:policy/AmazonESReadOnlyAccess"]]
        vpc_config_options = [None, VPC_CONFIG]

        # Come up with all possible combinations of those variables.
        combinations = list(itertools.product(
            cloudwatch_logs_options,
            custom_policies_options,
            dead_letter_config_options,
            policy_arns_options,
            vpc_config_options,
        ))
        assert len(combinations) == 32

        # Call the module using all of those variable combinations.
        count = 0
        expected_outputs = {}
        with self.create("combinations.tf.json"):
            for (
                cloudwatch_logs,
                custom_policies,
                dead_letter_config,
                policy_arns,
                vpc_config,
            ) in combinations:
                count += 1
                name = f"lambda_role_combination_{count}"
                role = yield block(
                    "module",
                    name,
                    {
                        "source": "../../",
                        "function_name": name,
                        "cloudwatch_logs": cloudwatch_logs,
                        "custom_policies": custom_policies,
                        "custom_policies_count": len(custom_policies),
                        "dead_letter_config": dead_letter_config,
                        "policy_arns": policy_arns,
                        "policy_arns_count": len(policy_arns),
                        "vpc_config": vpc_config,
                    },
                )
                yield block("output", name, {"value": role.name})
                expected_outputs[name] = name

        # Run terraform and create the resources.
        self.init()
        outputs = self.apply()

        # Check that the outputs were as expected.
        assert outputs == expected_outputs

    def test_destroy(self):
        self.destroy()
