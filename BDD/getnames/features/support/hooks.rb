Before do |scenario|
  # Feature name
  case scenario
    when Cucumber::Core::Ast::Scenario
      @feature_name = scenario.feature.name
    #when Cucumber::Core::Ast::OutlineTable::ExampleRow
    #  @feature_name = scenario.scenario_outline.feature.name
  end

   # Scenario name
  case scenario
    when Cucumber::Core::Ast::Scenario
      @scenario_name = scenario.name
    #when Cucumber::Core::Ast::OutlineTable::ExampleRow
    #  @scenario_name = scenario.scenario_outline.name
   end

  # Tags (as an array)
  @scenario_tags = scenario.source_tag_names
end
