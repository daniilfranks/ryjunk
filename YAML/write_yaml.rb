require 'yaml/store'

def store(*data)

  store.transaction do
    store[:fredrik] = "you are a nice guy"
    store[:ehej] = [1,2,3,4]
    store["greeting"] = {'hello' => "world"}
  end
end



store = YAML::Store.new("data.yml")

store.transaction do
  store[:fredrik] = "you are a nice guy"
  store[:ehej] = [1,2,3,4]
  store["greeting"] = {'hello' => "world"}
end

