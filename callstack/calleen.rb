

def just_do_it

  #puts caller[0][/`([^']*)'/, 1]

  puts caller[0].split("`").pop.gsub("'", "")
end


def and_again
  just_do_it
end


if __FILE__ == $PROGRAM_NAME

  #just_do_it

  and_again

end