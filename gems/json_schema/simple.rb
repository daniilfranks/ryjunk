
# https://github.com/ruby-json-schema/json-schema

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
  "a" => 5
}

JSON::Validator.validate(schema, data)

