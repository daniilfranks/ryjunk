

class MatchStatus
  NOTSTARTED = 0
  FIRSTPERIOD = 1

  def initialize()

  end
end



puts MatchStatus::NOTSTARTED


module Status
  BAD  = 13
  GOOD = 24

  def self.to_str(status)
    for sym in self.constants
      if self.const_get(sym) == status
        return sym.to_s
      end
    end
  end

end


mystatus = Status::GOOD

puts Status::to_str(mystatus)


puts Status::to_str(24)

