class PostsController < ApplicationController
  
  before_action(:find_post, only: [:edit, :update, :destroy])
  before_action(:find_topic, only: [:index, :new, :create, :edit, :update, :destroy])

  def index
    @posts = Post.where(topic_id: @topic.id)
  end

  def new
    @post = Post.new(topic: @topic)
    @path = [@topic, @post]
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to_post_if_valid('Post has successfully been created')
  end

  def edit
    @path = @post
  end

  def update
    @post.update(post_params)
    redirect_to_post_if_valid('Post has successfully been updated')
  end

  def destroy
    @post.destroy
    redirect_to(topic_posts_path(@topic), alert:'Post has successfully been deleted') 
  end

  private

  def find_topic
    if params[:topic_id]
      @topic = Topic.find(params[:topic_id])
    else
      @topic = @post.topic
    end
    
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
    redirect_to(post_replies_path(@post), notice: notice)
  end 
end
