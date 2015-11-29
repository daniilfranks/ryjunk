





if __FILE__ == $PROGRAM_NAME

  begin
    while true
    end

    rescue Interrupt => e
      puts 'Intervention by user, going for exit'
      exit

    rescue DataError => e
      puts 'Error caused by input or infrastructure...'
 
    rescue Exception => e
      puts e.class 
      puts "Leaving"
      exit

  end

end