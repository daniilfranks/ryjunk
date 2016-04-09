require 'rest-client'

class Client

  def initialize instans
  	@instance = instans
  end

  def post
  	@response = @instance.get
    puts @response.code 
  end	
end





if __FILE__ == $PROGRAM_NAME


  opta = RestClient::Resource.new "http://jsonplaceholder.typicode.com/posts/1",  {:Authorization => 'Bearer cT0febFoD5lxAlNAXHo6g'}
   
  the_client = Client.new(opta)

  the_client.post

end