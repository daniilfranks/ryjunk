
# https://gist.github.com/O-I/c40d89c4aeb16ae2fc3f
hash = { a: 1, b: 2, c: 3, d: 4 }

# the destructive case with removing exactly one key-value pair is easy
olle = hash.dup.tap { |h| h.delete(:a) }                         # => { b: 2, c: 3, d: 4 }
p hash
p olle