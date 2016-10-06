
# http://stackoverflow.com/questions/18364986/pull-scenario-outline-or-read-a-tag-from-within-cucumber-step

env.rb

eller hooks.rb ? 


Before do |scenario|
  # Feature name
  case scenario
    when Cucumber::Ast::Scenario
      @feature_name = scenario.feature.name
    when Cucumber::Ast::OutlineTable::ExampleRow
      @feature_name = scenario.scenario_outline.feature.name
  end

   # Scenario name
  case scenario
    when Cucumber::Ast::Scenario
      @scenario_name = scenario.name
    when Cucumber::Ast::OutlineTable::ExampleRow
      @scenario_name = scenario.scenario_outline.name
   end

  # Tags (as an array)
  @scenario_tags = scenario.source_tag_names
end


-----------------------------------

@feature_tag
Feature: Feature description

  @regular_scenario_tag
  Scenario: Scenario description
    Given scenario details

  @outline_tag
  Scenario Outline: Outline description
    Given scenario details
    Examples:
      |num_1  | num_2  | result |
      | 1        |   1       |   2     |
With step defined as:

Given /scenario details/ do
     p @feature_name
     p @scenario_name
     p @scenario_tags
end