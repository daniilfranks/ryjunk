require 'dry-validation'

schema = Dry::Validation.Schema do
  required(:email).filled

  required(:age).filled(:int?, gt?: 18)
end

errors = schema.call(email: 'jane@doe.org', age: 19).messages

puts errors.inspect

errors = schema.call(email: nil, age: 19).messages
#errors = schema.call(email: 'nfredrik@hotmail.com', age: 19).messages

raise "Wrong" unless errors.inspect == "{}"
