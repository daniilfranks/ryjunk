
module Observer

  def update(msg)
    puts "update called!!!"
    puts msg
      @pilutta = true
  end
  
  def init_observer(notifier)
    notifier.add_observer(self)
  end
end
World(Observer)