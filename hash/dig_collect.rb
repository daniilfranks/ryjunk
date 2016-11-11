
module HashDigAndCollect
  def dig_and_collect *keys
    keys = keys.dup

    next_key = keys.shift
    return [] unless self.has_key? next_key

    next_val = self[next_key]
    return [next_val] if keys.empty?

    return next_val.dig_and_collect(*keys) if next_val.is_a? Hash

    return [] unless next_val.is_a? Array
    next_val.each_with_object([]) do |v, result|
      inner = v.dig_and_collect(*keys)
      result.concat inner
    end
  end
end


client_with_many_addresses = {
  details: {
    first_name: "Florentino",
    last_name: "Perez"
  },
  addresses: [
    {
      type: "home",
      postcode: "SE1 9SG",
      street: "London Bridge St",
      number: 32,
      city: "London",
      location: {
        latitude: 51.504382,
        longitude: -0.086279
      }
    },
    {
      type: "office",
      postcode: "SW1A 1AA",
      street: "Buckingham Palace Road",
      number: nil,
      city: "London",
      location: {
        latitude: 51.5013673,
        longitude: -0.1440787
      }
    }
  ]
}


class Hash
  include HashDigAndCollect
end

if __FILE__ == $PROGRAM_NAME

#nisse = client_with_many_addresses.dup

#nisse.extend(HashDigAndCollect)


puts client_with_many_addresses.dig_and_collect(:addresses, :location, :latitude)

#puts client_with_many_addresses.dig_and_collect(:addresses, :street)




end

