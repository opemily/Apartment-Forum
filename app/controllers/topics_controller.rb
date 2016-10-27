class TopicsController < ApplicationController

  before_action(:authenticate_user!)
  before_action(:find_topic, only: [:show, :edit, :update, :destroy])

  def index
    @topics = Topic.all
  end

  def show
    @posts = @topic.posts
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(topic_params)
    redirect_to_topic_if_valid('Topic has successfully been created')
  end

  def update
    @topic.update(topic_params)
    redirect_to_topic_if_valid('Topic has successfully been updated')
  end

  def destroy
    @topic.destroy
    redirect_to(topics_path, alert:'Topic has successfully been destroyed') 
  end

  private

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params[:topic].permit(:title, :introduction)
  end

  def redirect_to_topic_if_valid(notice)
    redirect_to_topic(notice) if @topic.valid?
  end

  def redirect_to_topic(notice)
    redirect_to(@topic, notice: notice)
  end

end