class PicksController < ApplicationController
  # before_action :admin_user,     only: [:destroy, :create, :edit, :index, :new, :show, :update]
  before_action :second_user,     only: [:destroy, :create, :edit, :index, :new, :show, :update]

  def show
    if logged_in? && current_user.id == 2
      @pick = Pick.find(params[:id])
      @message = @pick.transmit
    else
      redirect_to root_path
    end
  end

  def new
    if logged_in? && current_user.id == 2
      @pick = Pick.new
    else
      redirect_to root_path
    end
  end

  def create
    @pick = Pick.new(pick_params)
    if @pick.save
      # flash[:success] = "Micropost created!"
      redirect_to @pick
    else
      render 'new'
    end
  end

  def destroy
    Pick.find(params[:id]).destroy
    # flash[:success] = "User deleted"
    redirect_to picks_url
  end

  def index
    if logged_in? && current_user.id == 2
      @picks = Pick.all
    else
      redirect_to root_path
    end
  end

  def edit
    if logged_in? && current_user.id == 2
      @pick = Pick.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @pick = Pick.find(params[:id])
    if @pick.update_attributes(pick_params)
      redirect_to @pick
    else
      render 'edit'
    end
  end

  private

  def pick_params
    params.require(:pick).permit(:context, :message_id, :transmit_id)
  end

  # Подтверждает администратора.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
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
