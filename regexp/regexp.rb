require 'date'

# ?<area>

#nn = "2016443RDYSVSPCC1.XML".match(/([\d]{7})([\w\d\.]+)/)

nn = "2016443RDYSVSPCC1.XML".match(/(?<datum>[\d]{7})(?<msg>[\w]{3})(?<src>[\w]{3})(?<dst>[\w]{3})(?<rrr>[\w\d\.]+)/)

puts nn[:datum]
puts nn[:msg]
puts nn[:src]
puts nn[:dst]

# 2016473

dt1 = Date.strptime('2016-W47-3', '%G-W%V-%u')

dt = Date.strptime(nn[:datum], '%G%V%u')

puts "no #{dt}"

puts "no1 #{dt1}"


puts '-' * 80


dt2 = DateTime.now # ('2016-11-23', '%G-W%V-%u')
puts dt2.strftime('%G%V%u')

