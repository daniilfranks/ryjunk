#!/usr/bin/env ruby

# TODO:
#
# Introduce Mocking and unit test for this MVC stuff
# Relevant Model in MVC? ping. own thread? for 
# slack, IRC, restAPI sinatra??
#
#
class DefectModel
  def initialize
    puts '0'
  end

  def get_summary(defect_id)
    puts '1'
  end

  def get_defect_list(component)
    puts '2'
  end

end

class DefectView

  def initialize
    puts '3'
  end

  def summary(summary_data, defectid)
    puts '4'
  end

  def defect_list(defeclist_data, component)
    puts '5'
  end

end

class Controller

  def initialize( model=nil, view=nil)
    @model ||= DefectModel.new
    @view  ||=  DefectView.new 
  end

  def get_defect_summary(defect_id)
    summary_data = @model.get_summary(defect_id)
    @view.summary(summary_data, defect_id)
  end

  def get_defect_list(component)
    defeclist_data = @model.get_defect_list(component)
    @view.defect_list(defeclist_data, component)
  end

end


if __FILE__ == $PROGRAM_NAME

  begin

  controller = Controller.new
  controller.get_defect_summary(34)

  controller.get_defect_list(42)
 
  rescue => msg
    puts msg
    puts msg.backtrace

  end
end