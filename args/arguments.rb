

class ArgTest

  def initialize(**args)
    puts **args

    puts args[:olle]

    puts "nisse: #{args[:nisse]}"
   
    @nisse = args[:nisse]

    @olle, @prefix, @nisse = args[:olle],args[:prefix],args[:nisse] 

    puts "go on!"
    puts @olle
    puts @prefix
    puts @nisse   
  end

end

class Another
  def initialize(args)

   args = defaults.merge(args)
   @nisse = args[:test]

   puts "#@nisse"  * 10
  end

  def defaults
    {test: 'mamma'}
  end
end



if __FILE__ == $PROGRAM_NAME

  args = {:olle=>"hej"}

  argTest = ArgTest.new(args)


#  argTest = ArgTest.new({:olle=>"hej", :prefix => true})
 
 argTest = ArgTest.new(:olle=>"hej", :prefix => true)

   another = Another.new(test1: 123)
end
