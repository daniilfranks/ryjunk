require 'rubygems'
require 'weary'


class Repos < Weary::Client

  domain "http://jsonplaceholder.typicode.com"
  

  get :get_post, "/posts/{id}" do | x |
    x.optional :test 
  end

  get :get_all_posts, "/posts" 

  get :posts_comments, "/posts/comments" 

  get :posts_comments, "/posts/comments" 

  get :contributors, "repos/:user/:repo/contributors" do | r |
    r.optional :anon1
  end 

  post :post_posts, "/posts"

  put  :put,  "/posts{id}"

  patch :patch,  "/posts{id}"

  delete :delete,  "/posts{id}"

  head  :head, "/"

  options :options, "/posts"

end


if __FILE__ == $PROGRAM_NAME

  require 'test/unit'
  require 'json' 

  class TC_jsonplaceHolderPOSTs < Test::Unit::TestCase

    def setup
      @client = Repos.new
    end

    # https://github.com/typicode/jsonplaceholder#how-to
    def test_post_with_payload

      req = @client.post_posts
      str_io = StringIO.new("{'userId' : 1 ,'title' : 'foo', 'body' : 'bar'}")
      req.body(str_io)
      response = req.perform {}
      puts "HEJ HEJ"
      puts response.inspect
      #puts response.status
      #assert_include [200, 201], response.body.status
      #assert response.success?
    end

  end

  class TC_jsonplaceHolder < Test::Unit::TestCase

    def setup
      @client = Repos.new
    end

    def test_get
      response = @client.get_post(:id => 1).perform
      assert_not_nil response
      #puts response.inspect
      assert response.success?

      # Why??  
      #assert_kind_of Weary::Response, response.class

      assert_include [200, 201], response.status
      #assert_include response.body, 'expedita'

      the_hash = JSON.parse(response.body)

      my_keys = ['userId', 'id', 'title', 'body']
      assert the_hash.has_key?('id')
      # Why?
      nisse =  my_keys.all? do | x | the_hash.has_key?(x) end
      assert nisse

      # Check values?
      # 
    end
 
    def test_get_all_posts
      response = @client.get_all_posts.perform
      #puts response.inspect  
      #puts response.body
      assert_not_nil response
      
     
    end

    def test_options
      response = @client.options.perform
      #puts response.inspect 

      # "GET,HEAD,PUT,PATCH,POST,DELETE"
      assert_not_nil response
      assert_not_nil response.header["access-control-allow-methods"]
      #puts response.header["access-control-allow-methods"].split(',')
    end

    def test_head
      response = @client.head.perform
      assert_not_nil response
      #puts response.inspect       
      assert response.length == 0
      assert_not_nil response.body 
    end


  end  

end
