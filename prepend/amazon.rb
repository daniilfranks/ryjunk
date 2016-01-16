
class Amazon

  def initialize
  end

  def reviews_of(book)
   return "Yes this is a book that need to be read"
  end


end


def deserves_a_look?(book)
  amazon = Amazon.new
  amazon.reviews_of(book).size > 20
end


module AmazonWrapper
  def reviews_of(book)
    start = Time.now
    result = super
    time_taken = Time.now - start
    puts "reviews_of() took more than #{time_taken} seconds" if time_taken > 0
    result
    rescue
      puts "reviews_of() failed"
      []
  end
end

Amazon.class_eval do
  prepend AmazonWrapper
end


if __FILE__ === $PROGRAM_NAME
  deserves_a_look?("hej hopp")
end
