class HelpMesController < ApplicationController
  helper_method :update_table

  def update_table(token = "#{YOUR TOKEN YOU MUST ENTER IT}",
                    room_id = "{YOUR ROOM ID I HAVE A SCRIPT FOR THIS}")

    hipchat_api = HipChat::API.new(token)
    recent_msgs = hipchat_api.rooms_history(room_id, "recent", "EST")["messages"]

    recent_msgs.each do |msg|
      if HelpMe.find_by_timing(msg["date"]).nil?   #eh it works (maybe)
        if ( msg["message"] =~ /[a-zA-Z]+\s?\d{1,2}[ab]?$/ )
          HelpMe.create!(author: msg["from"]["name"],
                        content: msg["message"].match(/[a-zA-Z]+\s?\d{1,2}[ab]?$/).to_s,
                        timing: msg["date"])
        end
      end
    end

    redirect_to help_mes_url
  end

  def resolve
    @help_me = HelpMe.find(params[:help_me_id])
    if @help_me
      @help_me.resolve!
    end
    redirect_to help_mes_url
  end

  def claim
    @help_me = HelpMe.find(params[:help_me_id])
    if @help_me
      @help_me.claim!
    end
    redirect_to help_mes_url
  end

  def index
    @help_mes = HelpMe.all
    render :index
  end
end