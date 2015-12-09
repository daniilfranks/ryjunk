    Feature: Showing off behave (tutorial01)

    As a having the role as a newbie
    I want  to understand how to compose a feature
    So that the benefit is that I can start using BDD/gherkin

    Background:
      Given that I have a table
      | test1 |  test2 |
      | data1 |  data2 |

      Given My that I have a table2
      | test3 |  test4 |
      | data3 |  data4 |
 
    Scenario: Run a simple test
      Given we have behave installed
      When we implement a test
      Then behave will test it for us!

    Scenario Outline: eating
    Given there are <start> cucumbers
    When I eat <eat> cucumbers
    Then I should have <left> cucumbers

    Examples:
    | start | eat | left |
    |  12   |  5  |  7   |
    |  20   |  5  |  15  |