require 'date'

# ?<area>

#nn = "2016443RDYSVSPCC1.XML".match(/([\d]{7})([\w\d\.]+)/)

nn = "2016443RDYSVSPCC1.XML".match(/(?<datum>[\d]{7})(?<msg>[\w]{3})(?<src>[\w]{3})(?<dst>[\w]{3})(?<rrr>[\w\d\.]+)/)

puts nn[:datum]
puts nn[:msg]
puts nn[:src]
puts nn[:dst]


#Date.strptime('2001-W05-6', '%G-W%V-%u')

dt = Date.strptime(nn[:datum], '%G%V%u')

puts dt