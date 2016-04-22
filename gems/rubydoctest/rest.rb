require 'rest-client'
=begin
doctest: Simple test
>> response = RestClient.get 'http://example.com'
#=> nil
>> response.code 
=> 200
>> response.headers
=> 'nisse'
=end
