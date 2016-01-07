require 'csv'

class Grader

  def initialize(file_path)
    @file_path = file_path
  end

  def parse!
  	CSV.foreach(@file_path, headers:true) do | row |
      exam = Exam.new(row)

      if exam.failed?
      	ExamMailer.failed!(exam)
      else
        ExamMailer.passed!(exam)
      end
    end
  end
end

class ExamMailer 

  def self.failed!(exam)
  	new(exam).failed!
  end

  def self.passed!(exam)
  	new(exam).passed!
  end

  def initialize(exam)
  	@exam = exam
  end

  def failed!
  	send_mail!('Post exam meeting invitation', failed_exam_email_body)
  end

  def passed!
  	send_mail!('Exam results', passed_exam_email_body)
  end

  private

  def send_mail!(subject, body)
  	mail = Mail.new
  	mail.to = @exam.student_email
  	mail.from = ' John Doe <john@doe.com>'
  	mail.subject = subject
  	mail.body = body
  	mail.deliver
  end

  def passed_exam_email_body
  	%Q{

  		Hi #{@exam.student_name}


  		you got #{@exam.scored_points} points
  	}
  end

  def failed_exam_email_body
  	%Q{
  		you got #{@exam.scored_points} points 
  	}
  end
end

class Exam
  attr_reader :student_name, :student_email, :scored_points

  def initialize(entry)
    @student_name = entry['first_name'] 
    @student_email = entry['email']
    @scored_points = entry['points'].to_i
  end

  def failed?
  	@scored_points < 50
  end

  def passed?
  	!failed?
  end


end






if __FILE__ == $PROGRAM_NAME

require 'minitest/autorun'
require 'minitest/emoji'
require 'test/unit'
require 'mail'

class ExamTest < MiniTest::Test

  def test_it_can_be_failed
    exam = Exam.new({'points' => '20'})
    assert exam.failed?
  end

  def test_it_can_be_passed
    exam = Exam.new({'points' => '51'})
    assert exam.passed?
  end

  def test_student_name
    student_name = 'Ilija'
    exam = Exam.new({'first_name' => student_name})
    assert_equal student_name, exam.student_name 
  end

  def test_student_email
  	student_email = 'illija@gov.net'
    exam = Exam.new({'email' => student_email})
    assert_equal student_email, exam.student_email
  end

end

Mail.defaults do
  delivery_method :test
end

class MailerTest < MiniTest::Test

  def assert_point(expected, actual)
    
    assert_block("Expected #{expected} to be equal to #{actual}") do
      expected = /you got #{expected} points/i
      expected.match(actual) != nil
    end
 
  end

 def setup
   Mail::TestMailer.deliveries.clear
   @student_email = 'john@doe.com'
   @student_name = 'John'
 
   @payload = {'points' => nil, 'email' => @student_email, 'first_name' => @student_name}
 end

 def test_failed_exam_mail
   @payload['points'] = '49'
   exam = Exam.new(@payload)
   ExamMailer.failed!(exam)

   mail = Mail::TestMailer.deliveries.first

   assert_equal @student_email, mail.to.first
   assert_equal "Post exam meeting invitation", mail.subject
   assert_match /you got #{@payload['points']} points/i, mail.body.raw_source
   #assert_point @payload[:points], mail.body.raw_source
 end

 def test_passed_exam_mail
   @payload['points'] = '50'
   exam = Exam.new(@payload)
   ExamMailer.passed!(exam)

   mail = Mail::TestMailer.deliveries.first

   assert_equal @student_email, mail.to.first
   assert_equal "Exam results", mail.subject
   assert_match /you got #{@payload['points']} points/i, mail.body.raw_source
 end    
    
end

Grader.new('grades.csv').parse!


end