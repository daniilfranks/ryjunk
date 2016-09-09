
# TODO: add ruby path
#       separate? store result in file,
#       read from other script? daemons?!
#       daemonize? start/stop/status?
#       save previous build!
#
#       Error cases, no contact with url(simulate) etc, ingen konfigurerad resulter osv.

require_relative './reader'
require_relative './resulter'
require_relative './presenter'


if __FILE__ == $PROGRAM_NAME

  begin
    config = KonfigReader.new

    resulter = ResultBuilder.get(config)

    config.presenter.each { | p |  Thread.new { PresenterBuilder.get(p, resulter) } }

    puts config

    resulter.run

  #rescue Exception => e
  #  puts "You hit Ctrl+C"
  end

  # TODO: catch Keyboardinterrupts?

end