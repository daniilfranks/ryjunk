require "observer"
require "jenkins_api_client"

POLL_TIME = 5

class ResultBuilder

  def self.get(config)
    return Module.const_get(config.resulter)::Resulter.new(config)
  end

end


class MyResulter
  include Observable

  def run
    @prev_build = nil

    loop do
      @current_build = read()
      give_em_an_update() if @current_build != @prev_build
      sleep POLL_TIME
    end

  end

  def give_em_an_update
      changed # notify observers
      @prev_build = @current_build
      print "Current price: #{@current_build}\n"
      notify_observers(Time.now, @current_build)
  end

end

module Real
class Resulter < MyResulter
  attr_reader :result

  def initialize config
    @config = config
    @client = JenkinsApi::Client.new(:server_url => @config.server)
    read
  end


  def read
    @result = "#{@client.job.get_current_build_status(@config.project)}"
  rescue
    return "other_stuff"

  end

end

end

module Fake

  class Resulter < MyResulter
    attr_reader :result

    def initialize config
    end

    def read
      ["success", "failure", "building", "other_stuff"].sample
    end

  end

end

