class Task
  attr_accessor :name, :parent

  def initialize(name)
  	@name = name
  	@parent = nil
  end

  def get_time_required
  	0.0
  end

end

class CompositeTask < Task

  def initialize(name)
    super(name)
    @sub_tasks = []
  end
	
  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end	

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.get_time_required }
    time
  end

   def ng_get_time_required
    time = @sub_tasks.reduce(0) { | sum, x | sum + x.get_time_required }
  end

end

class MixTask < Task

  def initialize
  	super('Mix that batter up')
  end

  def get_time_required
  	3.0
  end
	
end

class AddingredientTask < Task

  def initialize
  	super('Add dry ingredients')
  end

  def get_time_required
  	1.0
  end
	
end

class MakeBatterTask < CompositeTask
  def initialize
  	super('Make batter')
  	add_sub_task(AddingredientTask.new)
  	add_sub_task(MixTask.new)
  end
end


if __FILE__ == $PROGRAM_NAME

  make_batter_task = MakeBatterTask.new

  puts make_batter_task.ng_get_time_required

  puts make_batter_task.get_time_required


end