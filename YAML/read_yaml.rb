require 'yaml/store'

store = YAML::Store.new("data.yml")

store.transaction(true) do

  store.roots.each do | data_root_name |
    p "hej: #{data_root_name}"
    p store[data_root_name]
  end
end

