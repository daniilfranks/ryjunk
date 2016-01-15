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

#olles = testar.select do | key, val |  key == :olle end 

testar = Hash.new
testar[:mijje]  = {:olle=> "2", :fille => ''}
testar[:kalle]  = {:olle=> '  ', :fille => 'josse'}

#olles = testar.reject {|k,v| ![:olle].include?(k)}

#puts olle

hash = {:a => 1, :b => 2, :c => 3}

more = hash.reject {|k,v| ![:a,:b].include?(k)}

puts more

hash1 = {:a => 1, :b => 2, :c => 3}
hash2 = {:a => 1, :b => 2, :c => 3}

ll = [hash1, hash2]

puts 'hopp hopp'
more = ll.select do | item | item.select {|k,v| ![:a].include?(k)} end
puts more

h = {:a => 1, :b => 2}
h1 = {:a => 1, :b => 2}
h2 = {:a => 'janne', :b => 2}

kk = [h1, h2]

nisse = []
kk.each do | x | nisse << x.select{ |k, _ | k == :a } end

puts 'buuh'
hella = []
all = nisse.each do | k |  hella << k.collect{ |_ , v | v } end
puts hella.uniq

aa = {a: 1, b: 2}

aa[:c] = 3

puts aa



