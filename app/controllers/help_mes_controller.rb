class HelpMesController < ApplicationController
  helper_method :update_table

<<<<<<< HEAD
  def update_table(token = "a691fc881e4d73852291991d9b7973",
                    room_id = 865319)
=======
  def update_table(token = "#{YOUR TOKEN YOU MUST ENTER IT}",
                    room_id = "{YOUR ROOM ID I HAVE A SCRIPT FOR THIS}")
>>>>>>> 626042beb73e6be794861cb6a5f90d04b8bbcf8d

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
<<<<<<< HEAD

    if params[:min_updated_at]
      @help_mes = HelpMe.latest_help_mes(params[:min_updated_at])
      puts "knew there was a min"
    else
      puts "did not even know"
      @help_mes = HelpMe.latest_help_mes() #probably not what we ultimately want
    end

    respond_to do |format|
      format.html {render :index}
      format.json {render json: @help_mes}
    end
=======
    @help_mes = HelpMe.all
    render :index
>>>>>>> 626042beb73e6be794861cb6a5f90d04b8bbcf8d
  end
end