require 'rubygems'
require 'json-schema'


schema = {
  "type" => "object",
  "required" => ["a"],
  "properties" => {
    "a" => {"type" => "integer"}
  }
}

data = {
  "a" => "taco"
#  "a" => 123
}

begin
  JSON::Validator.validate!(schema, data)
rescue JSON::Schema::ValidationError
  puts $!.message
end
