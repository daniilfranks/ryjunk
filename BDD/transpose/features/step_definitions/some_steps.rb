
Given(/^I add the name$/) do |table|
  transposedTable = table.transpose
  #@data = transposedTable #.rows_hash


  puts 'table  begin ----------------'  
  puts table
  puts 'table  end ----------------'  
  
  puts 'transposed table  begin ----------------'  
  puts transposedTable
  puts 'transposed table  end ----------------'  

  

  # table is a Cucumber::Core::Ast::DataTable
#  pending # Write code here that turns the phrase above into concrete actions
end
