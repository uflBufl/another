class GameController < ApplicationController
  def play
    if logged_in?
      current_user.page_testplay = params[:id]
      current_user.save
    end
    @message = Message.find(params[:id])
    @picks = @message.picks.all
  end
end
