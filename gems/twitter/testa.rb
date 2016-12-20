require_relative './config'
require 'twitter'
require 'yaml'
require 'json' 

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = YOUR_CONSUMER_KEY
  config.consumer_secret     = YOUR_CONSUMER_SECRET
  config.access_token        = YOUR_ACCESS_TOKEN
  config.access_token_secret = YOUR_ACCESS_SECRET
end


#tweets = client.user_timeline('rubyinside', count: 20)
tweets = client.user_timeline('Muralgranskaren', count: 20)

#tweets.each { |tweet| puts tweet.full_text }

all_text = tweets.collect { |tweet| tweet.full_text }


# ... rest of the code here ...
 
#File.write('tweets.yml', YAML.dump(tweets))
#twts = JSON.pretty_generate(tweets)
File.write('tweets.json', JSON.dump(all_text))
#File.write('tweets.json', JSON.pretty_generate(tweets))
