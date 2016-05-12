require 'envyable'


Envyable.load('config/env.yml', environment='production')   #defaults to development

#ENV.each do | x | puts x end

puts ENV['API_CLIENT_ID']