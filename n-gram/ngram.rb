require 'solid_assert'
require_relative './logparser'
require_relative './my_ngram'

# http://www.blackbytes.info/2015/09/ngram-analysis-ruby/

SolidAssert.enable_assertions 


def filter_non_words(ngrams)
  ngrams.reject { |w1, w2| w1 !~ /^\w+/ || w2 !~ /^\w+/ }
end

CHAT_MESSAGE   = /(\d+-\d+-\d+) (\d+:\d+) (<\w+>) ([\w ]+)/

def get_trigrams_for_date(date)

  puts 'lets go ...'
  fetcher = URLFetcher.new("http://irclog.whitequark.org/ruby/#{date}.txt")
  logfile = LogFile.new("irc-log-#{date}.txt")

  irc = LogParser.new(date, fetcher, logfile)

  #msg = irc.get_messages.split("\n").select { |m| m.match(CHAT_MESSAGE) }.join

  tmp = irc.get_messages.split("\n")

  assert tmp.length == 0 , "tmp is empty"
  puts "number of lines: #{tmp.length}"
  msg = tmp.select { |m| m.match(CHAT_MESSAGE) }.join

  assert msg.class != NilClass , "NilClass"

  ngrams  = Ngram.new(msg).ngrams(3)
  ngrams  = filter_non_words(ngrams)
  bigrams = ngrams.map{ |n| n.join(' ') }

  bigrams.each_with_object(Hash.new(0)) { |word, obj| obj[word.downcase] += 1 }

end



if __FILE__ == $PROGRAM_NAME

  MIN_REPETIONS = 20
  total = {}

  # Get the logs for the first 15 days of the month and return the bigams
  (15..15).each do  | n |
    day = '%02d' % [n]

    total.merge!(get_trigrams_for_date "2015-04-#{day}") { | k, old, new | old + new }

  end

  # Sort in descending order
  total = total.sort_by { | k, v | -v }.reject do | k, v | v < MIN_REPETIONS end

  total.each do | k, v | puts "#{v} => #{k}" end

end
