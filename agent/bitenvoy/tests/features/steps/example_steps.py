from behave import given
from behave import then
from behave import when


@given('we have behave installed')
def step_impl(context):
    pass


@when('we implement {number:d} tests')
def step_impl_num(context, number):
    assert number > 1 or number == 0
    context.tests_count = number


@then('behave will test them for us!')
def step_impl_behave(context):
    assert context.failed is False
    assert context.tests_count >= 0
