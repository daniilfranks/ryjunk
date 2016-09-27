require 'date'

def just_do_it

  #puts caller[0][/`([^']*)'/, 1]

  puts caller[0].split("`").pop.gsub("'", "")
end


def and_again
  just_do_it
end


def ensure_login(args = {})
  
  args = my_defaults.merge(args)

  puts args

  # get a user

  # check if it's already allocated, if not continue... else new attempts

  the_user = get_a_user.find do | user |
     puts 'attempt...'
     check_allocs(user)
  end 

  puts "#{the_user.class}"
  raise "Did not get a user" if the_user.nil?
  # login with that user ....
  puts "#{the_user}"
end

def get_a_user
  [{user:'janne', password:'hallo'}, {user:'ulla', password:'allo'}]
end


def check_allocs usr
  [false, false, true, false, false, false, false].sample
end


def my_defaults
{ user:'nisse', password:'nimrod', env:'environ', ts: DateTime.now, caller: 'callers..'}
end

if __FILE__ == $PROGRAM_NAME

  #just_do_it

  and_again

  
  ensure_login

end