#!/usr/bin/env ruby
#
#  TODO: Error cases, no contact with url(simulate) etc, ingen konfigurerad resulter osv.

require 'awesome_print'
require_relative './reader'
require_relative './resulter'
require_relative './presenter'


if __FILE__ == $PROGRAM_NAME

  begin
    config = KonfigReader.new

    resulter = ResultBuilder.get(config)

    config.presenter.each { | p |  
      ap p
#      Thread.new { PresenterBuilder.get(p, resulter) } 
       PresenterBuilder.get(p, resulter) 
    }

    puts config

    resulter.run

  #rescue Exception => e
  #  puts "You hit Ctrl+C"
  end

  # TODO: catch Keyboardinterrupts?

end
