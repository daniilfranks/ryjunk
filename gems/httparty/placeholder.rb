require 'httparty'
require 'awesome_print'

VERSION = "1.1"



class PlaceHolder
  include HTTParty
  base_uri 'jsonplaceholder.typicode.com'

  def initialize()
  end

  def  my_posts(options={})
    options.merge!({basic_auth: @auth})
    self.class.get("/posts", options)
  end

  def  my_post(post_no = 1 )
    self.class.get("/posts/#{post_no}")
  end

  def now_post()
    req =  { data: {
    title: 'foo',
    body: 'bar',
    userId: 1}}

    self.class.post("/posts", req)
  end
 
end


place_holder = PlaceHolder.new
#ap place_holder.my_post(37)

nisse =place_holder.now_post()

#ap nisse.response
ap nisse.code
# pp twitter.timeline(:friends, query: {since_id: 868482746})
# pp twitter.timeline(:friends, query: 'since_id=868482746')
# pp twitter.post('this is a test of 0.2.0')
