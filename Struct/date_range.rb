require 'date'
require 'awesome_print'

class DateRange < Struct.new(:start_date, :end_date)
end




if __FILE__ == $PROGRAM_NAME


  date_range = DateRange.new
  date_range.start_date = DateTime.now 
  date_range.end_date = DateTime.now 

  ap date_range
  

end