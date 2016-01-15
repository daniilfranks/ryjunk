require 'timeout'


begin
	

  status = Timeout::timeout(5) {

  	sleep 7
	#puts 'We have timeouted!!!!'
  # Something that should be interrupted if it takes more than 5 seconds...
  }	

  rescue Timeout::Error => e
      puts e
      puts "We timedouted!!!"
      #puts e.backtrace
end
