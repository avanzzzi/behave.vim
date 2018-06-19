from behave import given, step, then, when


@given('I am using "{prg}"')
def using_emacs(context, prg):
    pass


@step("I am '{perc}' '{mood}'")
def not_happy(context, perc, mood):
    pass


@when('I switch to "{prg}"')
def switch_to_vim(context, prg):
    pass


@then('I will be happy')
def be_happy(context):
    pass
