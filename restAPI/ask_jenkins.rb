require 'jenkins_api_client'


@client = JenkinsApi::Client.new(:server_url =>"http://jenkins.svenskaspel.se/", :username => '', :password => '')
# The following call will return all jobs matching 'Testjob'
puts @client.exec_cli("version")
puts @client.job.list("cucumber.API.tests.playbook")  # cucumber.API.tests.playbook



#puts @client.job.get_builds("cucumber.API.tests.playbook")

# could be success, unstable or failure
puts @client.job.get_current_build_status("cucumber.API.tests.playbook")



#puts @client.job.list_all
# Read from correct Jenkins job (Playbook)

# Find out the result of the latest job, trending?

# Put it as a cron job? acron,  Run every minute ...  steady light on red/green/yellow 
# dependent of the outcomt

#puts @client.methods

#puts @client.instance_variables


puts "This is it!"