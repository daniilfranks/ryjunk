require 'awesome_print'

require 'yaml'

class YAMLReader

  attr_reader :project, :server, :resulter, :presenter, :sounds

  # TODO: if daemons, relpath will not do, how to solve?
  def initialize (file = "./my_file.yml")

    config = YAML.load_file(file)
    @project = config['project']
    @server = config['server']
    @resulter = config['resulter']
    @presenter = config['presenter']
    @sounds = config['sounds']
  end
end

require 'json'

class JSONReader

   attr_reader :project, :server, :resulter, :presenter, :sounds

  def initialize (file = "./the_configuration.json")
    file = File.open(file)
    data = file.read
    config = JSON.parse(data, object_class: OpenStruct)
    @project = config.project
    @server = config.server
    @resulter = config.resulter
    @presenter = config.presenter
    @sounds = config.sounds

    ap config
  end
end

class KonfigReader

  attr_reader :project, :server, :resulter, :presenter

  def initialize( reader = YAMLReader.new )
    @project = reader.project
    @server = reader.server
    @resulter = reader.resulter
    @presenter = reader.presenter

  end

  def to_str
    "KonfigReader, server:#@server, project: #@project, resulter: #@resulter, presenter: #@presenter "
  end

  def to_s
    to_str
  end
end


if __FILE__ == $PROGRAM_NAME

  n = JSONReader.new

  ap n.project
  ap n.presenter
  
end
