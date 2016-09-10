require 'date'
require 'awesome_print'

class DateRange < Struct.new(:start_date, :end_date)
end

DateRange2 = Struct.new("DateRange2", :start_date, :end_date)



def get_some_values(args)

  args = defaults.merge(args) 

  puts args[:date_range].start_date
  puts args[:nisse]
end

def defaults

#  { :date_range => DateRange2.new(:start_date => DateTime.now , :end_date => DateTime.now)  }
  { :date_range => DateRange2.new( DateTime.now ,  DateTime.now)  }

end


if __FILE__ == $PROGRAM_NAME


  date_range = DateRange.new
  date_range.start_date = DateTime.now 
  date_range.end_date = DateTime.now 

  #ap date_range

  date_range = DateRange2.new(DateTime.now , DateTime.now )
  #date_range.start_date = DateTime.now 
  #date_range.end_date = DateTime.now 

  #ap date_range
  
  get_some_values(nisse: 1)

end
