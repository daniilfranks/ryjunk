
def funny(args={})
 puts args
end

class MongoDB

  def initialize
  end

  def release args
    puts args
  end

end

class MyBuilder

  attr_writer :envs, :user, :time

  def initialize args(client = MongoDB.new)
    @client = client
  end

  def build

    arga = arga.merge(user: @users, time: @time)

    @envs.each do | env| 
      @client.release(arga) 
    }
  end

end



if __FILE__ == $PROGRAM_NAME


  #funny(nisse:1, olle:2)

  #funny({nisse:1, olle:2}

  mongo_client = MongoDB.new

  current = [{env:'itpk'}]
  user = "*"
  time = "*"

  if options.user
    arga =   {  user: options.user } 
    current = [{env:options.env}]
  end

  if options.removeenv
    current = [{env:options.env}]
  end

  if options.removeall
    current = all_envs.collect { |e | {env:e } }
  end

  if options.time
    arga =   {  time: Time.now.advance(hours: -options.time) } 
    current = [{env:options.env}]
  end


  current.each {| enve | 
    arga = arga.merge(enve)
    mongo_client.release(arga) 
  }


  my_builder = MyBuilder.new
  my_builder.envs = ((options.env)? options.env: all_env).collect { |e | {env:e } }
  my_builder.user = options.user if options.user
  my_builder.time = Time.now.advance(hours:options.time) if options.time

  my_builder.run unless options.list

  my_builder.list

end