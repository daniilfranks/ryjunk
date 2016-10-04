require 'sucker_punch'

class LogJob
  include SuckerPunch::Job

  def perform(event)
    puts event
  end
end



LogJob.new.perform("sync login")


LogJob.perform_async("async login")

LogJob.perform_in(3, "sync login 3 sec later...")

sleep 5
