
def checkRep
  puts 'checkRep'
end

def nisse
  puts 'Hello from nisse'
end


def public(func)
  puts 'from public'
  def wrapper
    checkRep
    func(*args)
    checkRep
  end
  return wrapper
end


p = public(nisse)


puts p


