require 'weary'

# https://vimeo.com/39610693

class Repos < Weary::Client

  domain "https://api.github.com/"
  
  get :repos, "users/:user/repos" 

  get :repo, "repos/:user/:repo" 

  get :contributors, "repos/:user/:repo/contributors" do | r |
    r.optional :anon
  end 

end


if __FILE__ == $PROGRAM_NAME
  client = Repos.new
  response = client.repos(:user => "mwunsch").perform
  puts response.body  
end
