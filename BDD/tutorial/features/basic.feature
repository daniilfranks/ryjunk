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

 #   @fast 
    Scenario: Run a simple test
      Given we have behave installed
      When we implement a test
      Then behave will test it for us!

#    #@jjj
    Scenario Outline: eating
    Given testing
    And there are <start> cucumbers
    When I eat <eat> cucumbers
    Then I should have <left> cucumbers

    Examples:
    | start | eat | left |
    |  12   |  5  |  7   |
    |  20   |  5  |  15  |

    Scenario Outline: Testing with several args
    Given more than one argument <start> <eat> <left>
    Given kallar omgång
    Given kallar omgångar
    Examples:
    | start | eat | left |
    | start | eat | left |
    |  12   |  5  |  7   |
    |  120  |  50 |  70  |
