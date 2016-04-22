

def convert_desc_old(string)

  if string.end_with?(' ')
    string.strip!
  else
    string+=' '
  end
end

def convert_desc(string)
  string.end_with?(' ')? string.strip! : string += ' '
end

n = 'nissE'.split('').last


puts n

k = n.capitalize()

if k == n

  puts 'we have a capital in end'
else
  puts 'we have a small letter in end'
end


p n.end_with?('E')


p convert_desc('hej hopp')

p convert_desc('hej hopp ')