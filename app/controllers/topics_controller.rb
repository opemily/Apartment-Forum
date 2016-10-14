class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    find_topic
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(topic_params)
    redirect_to_topic('Topic has successfully been created')
  end

  def edit
    find_topic
  end

  def update
    find_topic
    @topic.update(topic_params)
    redirect_to_topic('Topic has successfully been updated')
  end

  def destroy
    find_topic
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

  def redirect_to_topic(notice)
    redirect_to(@topic, notice: notice)
  end

end