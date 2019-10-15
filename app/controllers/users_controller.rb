class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    if logged_in? && current_user.id == 2
      @users = User.all
      # redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    if !(logged_in? && current_user?(@user))
      redirect_to root_path
    end
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to edit_user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def edit
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
    # @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

    private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Предфильтры

  # Подтверждает вход пользователя
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Подтверждает правильного пользователя
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Подтверждает администратора.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
