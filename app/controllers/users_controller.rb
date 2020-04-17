class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the alpha blog #{@user.display_name}"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def show
    @messages = @user.messages.all
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:display_name, :email, :password)
  end
end
