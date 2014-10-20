class HelpMe < ActiveRecord::Base

<<<<<<< HEAD
  def self.latest_help_mes(min_updated_at = nil)
    if min_updated_at
      where_line = "updated_at > :min_updated_at"
      where_options = { min_updated_at: min_updated_at }
      @help_mes = HelpMe.where(where_line, where_args)
    else
      @help_mes = HelpMe.all
    end

    @help_mes = @help_mes.where("resolved")

    @help_mes
  end

=======
>>>>>>> 626042beb73e6be794861cb6a5f90d04b8bbcf8d
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
<<<<<<< HEAD
=======
      # content
      #(content.split(//) - desk_number.to_s.split(//)).join.first.upcase
>>>>>>> 626042beb73e6be794861cb6a5f90d04b8bbcf8d
      content.match(/[a-zA-Z]+/).to_s
    end
  end

  def desk_number     #icky
    content.match(/\d{1,2}[ab]?/).to_s
  end

  def est_hour
    (timing[-13..-12].to_i - 4) % 24
  end

<<<<<<< HEAD
=======
  # def nice_mins
  #   timing.min.to_s.rjust(2, '0')
  # end

>>>>>>> 626042beb73e6be794861cb6a5f90d04b8bbcf8d
  def to_s
    "#{help_type} at Desk #{desk_number} by #{author} at #{timing[-13..-12]}:#{timing[-10..-9]}"
  end

end