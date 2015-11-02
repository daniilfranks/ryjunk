require 'jenkins_api_client'


@client = JenkinsApi::Client.new(:server_url =>"http://jenkins.svenskaspel.se/view/API-tester/job/cucumber.API.tests.playbook/",
         :username => 'fabv', :password => 'jagbor1Sumpan')
# The following call will return all jobs matching 'Testjob'
puts @client.exec_cli("version")
#@client.job.list("^playbook")
#puts @client.job.list("*")
# Read from correct Jenkins job (Playbook)

# Find out the result of the latest job, trending?

# Put it as a cron job? acron,  Run every minute ...  steady light on red/green/yellow 
# dependent of the outcomt

#puts @client.methods

#puts @client.instance_variables


puts "This is it!"