require 'yaml/store'
require 'jenkins_api_client'



job = Struct('Job', :running, :status)

def get_jenkins
  @client = JenkinsApi::Client.new(:server_url =>"http://jenkins.svenskaspel.se/", :username => 'fabv', :password => 'jagbor1Sumpan')

  # Could be success, unstable or failure, running, no contact!!
  result = @client.job.get_current_build_status("cucumber.API.tests.playbook")
  return result

end

#  Save result to a yaml file

def save_result
  store = YAML::Store.new("jenkins_result.yml")
  
  store.transaction do
    store[:jenkins_results] = results
  end

end

def read_result

end

def main()



end

#

if __FILE__ == $0

  # Mock the rest API! to verify internal stuff
  # Exception handling, internal etc.
  main()

end
