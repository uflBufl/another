class GamesController < ApplicationController
  before_action :second_user,     only: [:destroy, :create, :edit, :index, :new, :show, :update]

  def show
    if logged_in? && current_user.id == 2
      @game = Game.find(params[:id])
      @page = @game.first_page
    else
      redirect_to root_path
    end
  end

  def new
    if logged_in? && current_user.id == 2
      @game = Game.new
    else
      redirect_to root_path
    end
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
    if logged_in? && current_user.id == 2
      @games = Game.all
    else
      redirect_to root_path
    end
  end

  def edit
    if logged_in? && current_user.id == 2
      @game = Game.find(params[:id])
    else
      redirect_to root_path
    end
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
    if logged_in? && current_user.id == 1
    else
      redirect_to root_path
    end
  end

  def second_user
    if logged_in? && current_user.id == 2
    else
      redirect_to root_path
    end
  end

end
