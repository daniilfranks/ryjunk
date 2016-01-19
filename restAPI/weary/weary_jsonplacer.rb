require 'rubygems'
require 'weary'


class Repos < Weary::Client

  domain "http://jsonplaceholder.typicode.com"
  

  get :get_post, "/posts/{id}" do | x |
    x.optional :test 
  end
  
  get :posts, "/posts/1" 

  get :posts_1, "/posts" 

  get :posts_comments, "/posts/comments" 

  get :posts_comments, "/posts/comments" 

  get :contributors, "repos/:user/:repo/contributors" do | r |
    r.optional :anon1
  end 


  post :posts, "/posts" do | x |
    x.require :
  end

  put  :put,  "/posts{id}"

  patch :patch,  "/posts{id}"

  delete :delete,  "/posts{id}"

  head  :head, "/"

  options :options, "/posts"

end


if __FILE__ == $PROGRAM_NAME

  require 'test/unit'
  require 'json' 

  class TC_jsonplaceHolder < Test::Unit::TestCase

    def setup
      @client = Repos.new
    end

    # https://github.com/typicode/jsonplaceholder#how-to
    def test_zero_post
      response = @client.posts
      assert response.success?
    end

    def test_zero
      response = @client.get_post(:id => 1).perform
      assert response.success?

    end
 
%Q(#<Weary::Response:0x007f3194424ad8 @response=#<Rack::Response:0x007f3194424ab0 @status=200, @header={"server"=>"Cowboy", "connection"=>"close", "x-powered-by"=>"Express", "vary"=>"Origin", "access-control-allow-credentials"=>"true", "cache-control"=>"no-cache", "pragma"=>"no-cache", "expires"=>"-1", "x-content-type-options"=>"nosniff", "content-type"=>"application/json; charset=utf-8", "etag"=>"W/\"124-yv65LoT2uMHrpn06wNpAcQ\"", "date"=>"Tue, 19 Jan 2016 17:09:11 GMT", "via"=>"1.1 vegur", "Content-Length"=>"292"}, @chunked=false, @writer=#<Proc:0x007f3194424128@/home/fredrik/.rvm/gems/ruby-2.2.1/gems/rack-1.6.4/lib/rack/response.rb:30 (lambda)>, @block=nil, @length=292, @body=["{\n  \"userId\": 1,\n  \"id\": 1,\n  \"title\": \"sunt aut facere repellat provident occaecati excepturi optio reprehenderit\",\n  \"body\": \"quia et suscipit\\nsuscipit recusandae consequuntur expedita et cum\\nreprehenderit molestiae ut ut quas totam\\nnostrum rerum est autem sunt rem eveniet architecto\"\n}"]>, @status=200>
)
    def test_first_test
      response = @client.posts.perform
      #puts response.inspect  
      #puts response.body
      assert_not_nil response
      
      # Why??  
      #assert_kind_of Weary::Response, response.class

      assert_equal 201, response.status
      #assert_include response.body, 'expedita'

      the_hash = JSON.parse(response.body)

      my_keys = ['userId', 'id', 'title', 'body']
      assert the_hash.has_key?('id')
      # Why?
      nisse =  my_keys.all? do | x | the_hash.has_key?(x) end
      assert nisse

      # Check values?
    end

    def test_options
      response = @client.options.perform
      #puts response.inspect 

      # "GET,HEAD,PUT,PATCH,POST,DELETE"
      assert_not_nil response
      assert_not_nil response.header["access-control-allow-methods"]
      #puts response.header["access-control-allow-methods"].split(',')
    end

%Q(#<Weary::Response:0x00000001728430 @response=#<Rack::Response:0x00000001728408 @status=200, @header={"server"=>"Cowboy", "connection"=>"close", "x-powered-by"=>"Express", "vary"=>"Origin", "access-control-allow-credentials"=>"true", "accept-ranges"=>"bytes", "cache-control"=>"public, max-age=0", "last-modified"=>"Mon, 21 Dec 2015 18:53:20 GMT", "etag"=>"W/\"207f-151c5e38100\"", "content-type"=>"text/html; charset=UTF-8", "date"=>"Tue, 19 Jan 2016 19:25:32 GMT", "via"=>"1.1 vegur", "Content-Length"=>"0"}, @chunked=false, @writer=#<Proc:0x0000000171ec78@/home/fredrik/.rvm/gems/ruby-2.2.1/gems/rack-1.6.4/lib/rack/response.rb:30 (lambda)>, @block=nil, @length=0, @body=[""]>, @status=200>
)
    def test_head
      response = @client.head.perform
      assert_not_nil response
      #puts response.inspect       
      assert response.length == 0
      assert_not_nil response.body 
    end


  end  

end
