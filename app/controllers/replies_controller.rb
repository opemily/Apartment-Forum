class RepliesController < ApplicationController
  before_action(:find_post, only: [:edit, :update, :destroy])
  before_action(:find_post_by_params, only: [:index, :new, :create])
  before_action(:find_post, only: [:edit, :update, :destroy])

  def index
    @replies = Reply.where(post_id: @post.id)
  end

  def new
    @reply = Reply.new(post: @post)
    @path = [@post, @reply]
  end

  def create
    @reply = current_user.replies.create(reply_params)
    redirect_to_replies_if_valid('Reply has successfully been created')
  end

  def edit
    @path = @reply
  end

  def update
    @reply.update(post_params)
    redirect_to_replies_if_valid('Reply has successfully been updated')
  end

  def destroy
    @reply.destroy
    redirect_to(post_replies(@post), alert: 'Reply has successfully been deleted')
  end

  private

  def find_post_by_params
    @post = Post.find(params[:post_id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_reply
    @reply = Reply.find(params[:id])
  end

  def redirect_to_reply_if_valid(notice)
    redirect_to_reply(notice) if @reply.valid?
  end

  def redirect_to_reply(notice)
    redirect_to(post_replies_path, notice: notice)
  end
end
