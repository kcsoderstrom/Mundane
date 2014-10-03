class HelpMe < ActiveRecord::Base

  def resolve!
    self.update!(resolved: true)
  end

  def claim!
    self.update!(claimed: true)
  end

  def help_type
    if content[0] == "q"
      "Question"
    elsif content[0] == "r"
      "Review request"
    else
      # content
      #(content.split(//) - desk_number.to_s.split(//)).join.first.upcase
      content.match(/[a-zA-Z]+/).to_s
    end
  end

  def desk_number     #icky
    content.match(/\d{1,2}[ab]?/).to_s
  end

  def est_hour
    (timing[-13..-12].to_i - 4) % 24
  end

  # def nice_mins
  #   timing.min.to_s.rjust(2, '0')
  # end

  def to_s
    "#{help_type} at Desk #{desk_number} by #{author} at #{timing[-13..-12]}:#{timing[-10..-9]}"
  end

end