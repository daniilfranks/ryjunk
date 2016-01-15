require 'yaml/store'
require 'jenkins_api_client'



job = Struct.new('Job', :running, :status)

def get_jenkins
  @client = JenkinsApi::Client.new(:server_url =>"http://jenkins.svenskaspel.se/", :username => 'fabv', :password => 'basTrombone16')

  # Could be success, unstable or failure, running, no contact!!
  result = @client.job.get_current_build_status("cucumber.API.tests.playbook")
  return result

end

#  Save result to a yaml file

def save_result(res)
  store = YAML::Store.new("jenkins_result.yml")
  
  store.transaction do
    store[:jenkins_results] = res
  end

end

def read_result

end

def main()

  begin

    # Read result from jenkins
    result = get_jenkins()

    puts result

    # Store the result in a YAML-file
    save_result(result)
  rescue => e
    puts 'Help we hit an exception!'
    puts e
    #puts e.traceback
  end

end

#

if __FILE__ == $PROGRAM_NAME
  # Mock the rest API! to verify internal stuff
  # Exception handling, internal etc.
  main()

end
