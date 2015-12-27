
class Ngram
  def initialize(input)
    @input = input
  end

  def ngrams(n)
    @input.split.each_cons(n).to_a
  end

end
