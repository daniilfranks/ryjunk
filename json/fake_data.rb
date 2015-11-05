require 'find'
require 'pp'
require 'json'
require 'singleton'
require 'pathname'

class JSONReader

  attr_reader :events, :requirements

  def initialize(filename)

    @filename = filename
    raise "File #{@filename} not found" if not File.exist?(@filename)
    fh = File.open(@filename)

    load_def_file_w_handler fh
  end

  def load_def_file_w_handler filehandle

    if @filename
      @data =  (File.extname(@filename) == '.gz')? Zlib::GzipReader.new(filehandle).read : filehandle.read
    else
      @data = filehandle.read
    end

    # Load json and convert to events
    json = JSON.parse(@data, object_class: OpenStruct)
    @events = json.events
    @requirements = (json.requirements.nil?)? []: json.requirements

  end

end

class JSONFinder

  def initialize(root_dir, json_dir="olle")

    raise 'Directory not found' if not Dir.exists?(root_dir)

    nn = Dir.glob(root_dir + '/**/*/').select { |fn| File.directory?(fn) }
    @json_files_path = nn.find do |d | d.include? json_dir  end

    #TODO: Filter better for *.json and *.json.gz
    files = File.join(@json_files_path, "**", "*.json*")
    @json_files = Dir.glob(files)

    raise "No jsonfiles to handle" if @json_files.empty?
  end

  attr_reader :json_files, :json_files_path

end

class DataBuilder

  attr_reader :all_players

  def initialize(files, aggr_reqs)

    all_reqs = Array.new
    @all_players = Hash.new(0)

    for file in files
      js = JSONReader.new(file)

      if not js.requirements.nil?
        all_reqs << js.requirements
      end
    end

    nil_counter = 0
    all_reqs.each do | req |

      begin
        ps = req.Player   # Some files do not have Player info
      rescue
        next
      end

      ps.to_h.each do |k,v|

        if not @all_players.has_key?(k.to_s)

          @all_players.merge!( v.Id =>
                            { :Id => v.Id,
                              :members =>  {
                                  :name => v.members.name,
                                  :first_name => v.members.firstname,
                                  :last_name => v.members.lastname
                              }
                            }
          )
          nil_counter+=1 if v.members.name.nil?

        end
      end
    end

    puts "#{@all_players.length} unique players"

    #no_of_nil = @all_players.reduce do | x | x["members"]["name"].nil? end

    puts "#{nil_counter} nil players!"

    player = {:Player => @all_players}  #:Team => 'nisse',
    reqs = {:requirements => player}
    fh = File.open(aggr_reqs, 'w')
    fh.write(JSON.pretty_unparse(reqs))
    fh.close()

  end

end

class FakeDataBuilder

  def initialize(infile, outfile)

    data = File.readlines(infile)
    names =Hash.new

    data.each_with_index do | x, i |

      # (10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21'),
      fields = x.split(',')

      first = fields[2].gsub("'","")
      last = fields[3].gsub("'","")
      name = first + ' ' + last
      idx = 9000000 + i   #TODO: relevant no?
      names.merge!( idx =>
                    { :Id => idx,
                        :members =>  {
                          :name => name,
                            :first_name => first,
                            :last_name => last
                        }
                    }
      )
    end

    player = {:Player => names}
    reqs = {:requirements => player}
    fh = File.open(outfile, 'w')
    fh.write(JSON.pretty_unparse(reqs))
    fh.close()
  end
end


if __FILE__ == $0

  #env_helper  = EnvironmentHelper.new
  env_helper  = '.'
  json_finder = JSONFinder.new(env_helper.home)
  puts "#{json_finder.json_files.length} number of json files, json.gz and json found"

  aggr_reqs = json_finder.json_files_path + 'aggregated_requirements.txt'
  DataBuilder.new(json_finder.json_files, aggr_reqs)

  infile = json_finder.json_files_path + 'names.txt'
  outfile = json_finder.json_files_path + 'fake_requirements.txt'
  FakeDataBuilder.new(infile,outfile)

end