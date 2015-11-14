
class ClassBuilder

  # TODO: Better ways to write a ruby file??
  def initialize(filename, class_name)
    @fh = File.open(filename, 'w')
    @fh.write("class #{class_name}\n")
  end

  def create_method(name,header='')
    @fh.write("  def #{header}#{name}\n")
    @fh.write("    fail NotImplementedError\n")   
    @fh.write("  end\n\n")
  end

  def close
    @fh.write("end\n")
    @fh.close()
  end
end

class FileBuilder

  attr_reader :klass_name, :filename

  def initialize(filename, class_name, model) 
    @filename = filename
    @klasse = ClassBuilder.new(filename, class_name.to_s)
    @model = model
    @klass_name = class_name.to_sym
  end

  def system
    @model.mbt_actions.keys.each do |var| @klasse.create_method(var) end
    @klasse.close()
  end

  def driver
    @model.mbt_states.keys.each do |var|  @klasse.create_method(var,header='test_') end
    system 
  end

end

class ParseModelFile
  attr_reader :mbt_actions, :mbt_states

  def initialize(filename)
    puts 'Parsing of model file started...' 
    # TODO: Parse csv-file and check for states and 
    # transistions.
    # Forbid other formats than; state1, action1, state2
    cntr=0 
    @mbt_states = Hash.new
    @mbt_actions = Hash.new

    File.foreach(filename) do |row|
    
      # TODO: better check than first row, perhaps blank in names?
      cntr+=1
      next if cntr==1

      # TODO: check how to be sure that we have 3 colons?
      # Check for blanks in names
      # check for 3 colons!
      state1, action, state2 = row.split(',')

      @mbt_states[state1.chomp]=1
      @mbt_states[state2.chomp]=1
      @mbt_actions[action.chomp]=1
    end

  end

end

class VerifyRubyFile
  
  def initialize(object)
     # Skip file extension when using require
    file_name = object.filename.split('.').first
    require_relative "#{file_name}"
    object.klass_name
    # TODO: call a method to see if there is a raise !
    # TODO: run ruby-lint and rubocop on these files
  end

end
 
if __FILE__ == $PROGRAM_NAME

  # TODO: include arguments to this program. Should it reside in overall file?

  args = {:model => "test1.csv", :system_file => "system_stub.rb",
         :driver_file => "sut_driver_stub.rb"}

  model = ParseModelFile.new(args[:model])

  "Create SUT"
  systeme = FileBuilder.new(args[:system_file],:System, model)
  systeme.system 
  
  "Create SUT-driver"
  driver = FileBuilder.new(args[:driver_file], :SystemDriver, model)
  driver.driver 

  "Verify the result"
  VerifyRubyFile.new(systeme)
  VerifyRubyFile.new(driver)

end



