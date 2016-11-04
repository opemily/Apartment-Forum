class UsersController < ApplicationController

  before_action(:find_user, only: [:show, :edit, :update, :destroy])

  def index
    @users = User.where.not(id: current_user.id).order(:apt, :last_name, :first_name)
  end

  def show
    @topics = Topic.all
    @posts = Post.where(user_id: params[:id])
    @replies = Reply.where(user_id: params[:id])
  end

  def update
    @user.update(params[:user].permit(:admin, :landlord, :super))
    redirect_to(users_path, notice: 'User status has successfully been updated')
  end

  def destroy
    @user.destroy
    redirect_to(users_path, alert:'User has successfully been deleted') 
  end

private

  def find_user
    @user = User.find(params[:id])
  end


end
