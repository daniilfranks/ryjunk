require_relative 'resulter'

class Launcher


  def initialize(resulter: FileResulter.new)
    @resulter = resulter

    @save = [{matchid:"234", result:"fail", env:"teerve"},
             {matchid:"23", result:"exception", env:"teeraa"}]
  end

  def save

    @save.each do | m |
      @resulter.create(matchid: m[:matchid], result: m[:result], env: m[:env])  
    end

  end

end



if __FILE__ == $PROGRAM_NAME

launcher = Launcher.new(resulter: Match)
launcher.save




launcher = Launcher.new(resulter: FileResulter.new)
launcher.save


end
