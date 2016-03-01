
# one liners recommended to use {}  Also often used when returning something.
# more complicated on several rows us do end. When the side effects are the result


a_block = ->(x) do puts x end

a_block.call('hi')

def times(n)

->(x) { x * n }

end



module EventDispatcher

  def setup_listerners
    @event_dispatch_listerners = {}
  end

  def subscribe(event, &callback)
    (@event_dispatch_listerners[event] ||= [] )  << callback
    puts @event_dispatch_listerners
  end
  
  protected
  def notify(event, *args)
    if @event_dispatch_listerners[event]
      @event_dispatch_listerners[event].each do | m |
        yield(m.call(*args)) if respond_to? :call
      end 
    end
    return nil   
  end

end

class Portal

  include EventDispatcher

  def initialize
    setup_listerners
  end

  def render
    puts '<table>'
      render_block = -> (box) do puts '<td>#{box}</td>' end
      [:row1, :row2].each do | row |
        puts '<tr>'
        notify(row, &render_block)
        puts '</tr>'   
      end  
    puts '<table>'
  end

end


if __FILE__ == $PROGRAM_NAME


  portal = Portal.new

  portal.subscribe(:row1) {"Stock Ticker"}
  puts portal.render



  circumference = times(2*Math::PI)

  puts circumference.call(3)

  puts [1,2,3].collect(&circumference)



end

