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

status_tr = {nil => "exception", false => 'normal exit', "aborting" => 'abort', 
             "sleep" => "sleep", "run" => "run"}

status_tr.default= "unknown exit"
threads = []
begin 

  threads << Thread.new { raise("die now") }
  #threads << Thread.new { Thread.stop }
  threads << Thread.new { Thread.exit 2 }
   threads << Thread.new { Thread.exit  }
  #threads << Thread.new { exit 2 } 
  threads << Thread.new { raise Exception }
  threads.each { |thr| thr.join }

rescue => e
  #puts e.inspect
end

threads.each { |thr| puts "dd #{status_tr[thr.status]}" }
puts "*"*40
threads.each { |thr| puts "dd #{thr.status}" }
# Join and check how the thread did exit



#launcher = Launcher.new(resulter: Match)
#launcher.save




launcher = Launcher.new(resulter: FileResulter.new)
launcher.save


end
