class MessagesController < ApplicationController
  # before_action :admin_user,     only: [:destroy, :create, :edit, :index, :new, :show, :update]
  before_action :second_user,     only: [:destroy, :create, :edit, :index, :new, :show, :update]
  # before_action :check_user,     only: [:destroy, :create]

  def show
      @message = Message.find(params[:id])
      @picks = @message.picks.all
  end

  def destroy
    Message.find(params[:id]).destroy
    # flash[:success] = "User deleted"
    redirect_to messages_url
  end

  def new
      @message = Message.new
  end

  def create
    @message = Message.new(message_params)    # Не окончательная реализация!
    if @message.save
      redirect_to @message
    else
      render 'new'
    end
  end

  def index
      @messages = Message.all
  end

  def edit
      @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(message_params)
      redirect_to @message
    else
      render 'edit'
    end
  end

  private

    def message_params
      params.require(:message).permit(:value, :comment)
    end

  # Подтверждает администратора.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
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
