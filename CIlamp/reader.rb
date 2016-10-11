class Reader

  attr_reader :project, :server, :resulter, :presenter

  def initialize
    @project = 'cucumber.API.tests.playbook'
    @server ='http://jenkins.svenskaspel.se/'
    @resulter = 'Fake'
    @presenter = 'StdOut'
  end

end

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

class JSONReader
  def initialize (file = "./the_configuration.json")
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
