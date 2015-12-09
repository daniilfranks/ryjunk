# -*- coding: utf-8 -*-

testar = Hash.new

testar[:mijje]  = {:olle=> 2, :fille => ''}
testar[:kalle]  = {:olle=> '  ', :fille => 'josse'}

# Om en värde är tomma strängen sätt det till nil!!

def my_test(val, k,v)
  if v.is_a?(String)
    if v.strip.empty? 
      val[k] = nil
    end
  end
end

puts testar

pelle = testar.each do | _, val | 
          val.each do | k, v |  
            my_test(val, k, v)
          end 
        end

puts pelle 

pelle.each do | _, val | val.delete_if do | key, val | val.nil? end end

puts pelle

nisse = {:olle=> '2', :fille => ''}


nisse.delete_if do | key, val | val.strip.empty? end

puts nisse

testar = Hash.new

testar[:mijje]  = {:olle=> "2", :fille => ''}
testar[:kalle]  = {:olle=> '  ', :fille => 'josse'}


ll =testar.each do | _, val | val.delete_if do | key, val | val.strip.empty? end end

puts 'last stuff'
puts ll

puts 'hej', testar[:kalle][:fille]

first = {:olle=>2}
second = {:olle=>1}
result = Hash.new

first.each do |k, v | result[k] = second[k] if second[k] != v end

puts result
