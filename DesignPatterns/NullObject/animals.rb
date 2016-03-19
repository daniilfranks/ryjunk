
class Animal
  attr_reader :name
  def initialize(name)
  	@name = name
  end	
  def self.find(id)
    animals = {:pig => true, :sheep => true}
  	return Animal.new(id) if id != ''
  	return nil
  end

end

# The active nothing
class MissingAnimal
  attr_reader :name	
  def initialize
  	@name = 'missing animal'
  end
end


class GuaranteedAnimal
  def self.find(id)
  	Animal.find(id) || MissingAnimal.new
  end

end


if __FILE__ == $PROGRAM_NAME

  puts 'let go ...'
  ids = ['pig', '', 'sheep']

  animals = ids.map do | id | GuaranteedAnimal.find(id) end

  #puts animals

  animals.each do | animal | puts animal.name end


end

