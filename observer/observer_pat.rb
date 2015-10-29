require "observer"
require_relative 'warner'

class Ticker          ### Periodically fetch a stock price.
  include Observable

  def initialize(symbol)
    @symbol = symbol
  end

  def run
    last_price = nil
    loop do
      price = Price.fetch(@symbol)
      print "Current price: #{price}\n"
      if price != last_price
        changed                 # notify observers
        last_price = price
        notify_observers(Time.now, price)
      end
      sleep 1
    end
  end
end

class Price           ### A mock class to fetch a stock price (60 - 140).
  def self.fetch(symbol)
    60 + rand(80)
  end
end

if __FILE__ == $0
  ticker = Ticker.new("MSFT")
  WarnLow.new(ticker, 80)
  WarnHigh.new(ticker, 120)
  ticker.run
end