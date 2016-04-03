# class defintion - all the internal stuff!

class Station
        def initialize(raw)
                @info = raw.chomp.split("\t")
        end
        def getTLC()
                @info[1]
        end
        def getPassengers()
                @info[-1].to_i
        end
        def getFullName()
                @info[6]
        end
        def getLat()
                @info[4].to_f
        end
        def getLong()
                @info[5].to_f
        end
        def getDistance(toWhere)
                lat1 = getLat()
                lat2 = toWhere.getLat
                long1 = getLong
                long2 = toWhere.getLong
                diff_x = (lat1 - lat2 ) * 75.0
                diff_y = (long1 - long2 ) * 50.0
                dist = Math.sqrt(diff_x * diff_x + diff_y * diff_y)
        end
        def getDistanceText(toWhere,places=2)
                actual = getDistance toWhere
                "%.#{places}f" % actual
        end
end

def loadStationFactory
        require 'fileutils'
        puts FileUtils.pwd 
        all = {}
        File.new("./rstats2014.xyz").readlines.each do |record|
                puts "record:#{record}"
                current = Station.new record
                tlc = current.getTLC
                all[tlc] = current
        end
        return all
end

# ------------------------------------------

# first (test) program

# No need to understand the internal / data file format in the user or test program

if __FILE__ == $PROGRAM_NAME

  all = loadStationFactory
  puts all["PLY"].getPassengers()
  puts all["PLY"].getFullName()

  # This not brilliant - formatting an interstation distance should be in the class
  distance = all["PLY"].getDistance all["MKM"]
  puts "Distance is #{'%.2f'%distance}"

  dtext = all["PLY"].getDistanceText all["MKM"]
  puts "Distance is #{dtext}"

  # optional parameter - number of decimal places (default is 2)
  dtext = all["PLY"].getDistanceText all["MKM"],1
  puts "Distance is #{dtext}"
else
  puts "Loaded #{__FILE__} into #{$0} - my copyright!"
end
