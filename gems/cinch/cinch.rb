require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "localhost"
    c.channels = ["#mig"]
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end
end

bot.start