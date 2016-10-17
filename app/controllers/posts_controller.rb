class PostsController < ApplicationController

  def index
    @posts = Post.where(topic_id: params[:id])
  end
  
end
