from behave import runner_util
from behave.step_registry import registry
import sys
import os

def get_step_definition(feature, input):
    parsed_input = " ".join(input.lstrip().split(" ")[1:]).lstrip()
    base_path = os.path.dirname(os.path.abspath(feature))
    steps_paths = [os.path.join(base_path,"steps")]

    runner_util.exec_file(os.path.join(base_path,"environment.py"))
    runner_util.load_step_modules(steps_paths)

    for step_type in registry.steps.keys():
        steps = list(registry.steps[step_type])
        if not steps:
            continue

        for step in registry.steps[step_type]:
            if step.match(parsed_input):
                file = step.location.abspath()
                line = step.location.line
                print(f"edit +{line} {file}")
                exit(0)
                return
    print("echo 'Not found'")
    exit(1)
