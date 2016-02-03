
module Observer

  def update(obj)
    puts "update called!!!"
    puts obj.inspect
    obj.pilutta  = true
  end
  
  def init_observer(notifier)
    notifier.add_observer(self)
  end
end
World(Observer)