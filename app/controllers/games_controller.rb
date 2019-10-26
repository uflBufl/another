class GamesController < ApplicationController
  before_action :second_user,     only: [:destroy, :create, :edit, :index, :new, :show, :update]

  def show
      @game = Game.find(params[:id])
      @page = @game.first_page
  end

  def new
      @game = Game.new
  end


  def create
    @game = Game.new(game_params)
    if @game.save
      # flash[:success] = "Micropost created!"
      redirect_to @game
    else
      render 'new'
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    # flash[:success] = "User deleted"
    redirect_to games_url
  end

  def index
      @games = Game.all
  end

  def edit
      @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :author, :image, :first_page_id)
  end

  def first_user
    unless logged_in? && current_user.id == 1
      redirect_to root_path
    end
  end

  def second_user
    unless logged_in? && current_user.id == 2
      redirect_to root_path
    end
  end

end
