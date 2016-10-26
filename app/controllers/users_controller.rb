class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).order(:apt, :last_name, :first_name)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user].permit(:admin, :landlord, :super))
    redirect_to(users_path, notice: 'User status has successfully been updated')
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_path, alert:'User has successfully been deleted') 
  end


end
