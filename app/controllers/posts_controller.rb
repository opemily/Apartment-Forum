class PostsController < ApplicationController
  
  before_action(:find_post, only: [:show, :edit, :update, :destroy])
  before_action(:find_topic, only: [:new, :create])

  def new
    @post = Post.new(topic: @topic)
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to_post_if_valid('Post has successfully been created')
  end

  def update
    @post.update(post_params)
    redirect_to_post_if_valid('Post has successfully been updated')
  end

  def destroy
    @topic = @post.topic
    @post.destroy
    redirect_to(topic_path(@topic), alert:'Topic has successfully been destroyed') 

  end

  private

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params[:post].permit(:topic_id, :title, :body)
  end

  def redirect_to_post_if_valid(notice)
    redirect_to_post(notice) if @post.valid?
  end

  def redirect_to_post(notice)
    redirect_to(@post, notice: notice)
  end
  
end
