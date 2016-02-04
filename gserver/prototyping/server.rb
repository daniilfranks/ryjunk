require 'gserver'

# http://www.rubydoc.info/stdlib/gserver/GServer

#
# A server that returns the time in seconds since 1970.
#
class TimeServer < GServer
  def initialize(port=10001, *args)
    super(port, *args)
  end

  # Parse a message and reply with something relevant
  def serve(io)
    # Read a Struct or something similar?

    io.puts(Time.now.to_i)
  end
end

# Run the server with logging enabled (it's a separate thread).
server = TimeServer.new
server.audit = true                  # Turn logging on.
server.start

sleep 2*60
