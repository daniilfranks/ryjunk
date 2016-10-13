require 'awesome_print'
require 'thread'
require 'timeout'

class EchoJob

  def call(message)
    puts message
  end

end

Job = Struct.new(:worker, :params)


module Work

  @queue = Queue.new
  @no_threads = 1
  @workers = []
  @running = true 

  module_function

  def process_jobs
    while @running
      job = nil
      Timeout.timeout(3) do
        job = @queue.pop
      end
      puts 'got a job!'
      job.worker.new.call(*job.params)
    end
  rescue
        puts 'timeouted, continue ...'
  end

  def enqueue(worker, *params)
    @queue << Job.new(worker, params)
  end

  def start
    @workers = @no_threads.times.map { Thread.new { process_jobs} }
  end

  def drain
    loop do
      break if @queue.empty?
      sleep 1
      ap @queue.num_waiting
      ap @queue.size

    end
  end
 
  def stop
    @running = false
    @workers.each(&:join)
  end

end




if __FILE__ == $PROGRAM_NAME


5.times { | n | Work.enqueue(EchoJob, "I counted to #{n}") }

puts "Process jobs in another thread(s)"
Work.start

puts "Block until all jobs are processed"
Work.drain


puts "Stop the workers"
Work.stop


end

