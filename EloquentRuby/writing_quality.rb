
module WritingQuality

  CLICHES = [ /play fast and loose/,   
              /make no mistakes/
  ]


  def number_of_cliches
    CLICHES.inject(0) do | count, phrase |
      count += 1 if phrase =~ content
      count
    end
  end

end