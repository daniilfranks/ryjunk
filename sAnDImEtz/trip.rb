class Trip
  attr_reader :bicycles, :customers, :vehicle
  
  def initialize
    @bicycles = [1,33]
  end
  def prepare(preparers)
    preparers.each {|preparer|
      preparer.prepare_trip(self)}
  end
end

# when every preparer is a Duck
# that responds to 'prepare_trip'
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each {|bicycle|
      prepare_bicycle(bicycle)}
  end

  def prepare_bicycle(bicycle)
    puts "prepare bicycle #{bicycle}"
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  # ...
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
  # ...
end


if __FILE__ == $PROGRAM_NAME

  trip = Trip.new

  prepares = []
  prepares << Mechanic.new

  1.times do
    trip.prepare prepares
  end
end
