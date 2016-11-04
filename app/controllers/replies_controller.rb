class RepliesController < ApplicationController
  before_action(:find_reply, only: [:show, :edit, :update, :destroy])
  before_action(:find_post, only: [:index, :new, :create, :show, :edit, :update, :destroy])

  def index
    @replies = Reply.where(post_id: @post.id).hash_tree
  end

  def new
    if params[:parent_id]

      @reply = Reply.new(post_id: params[:post_id], parent_id: params[:parent_id])
    else

      @reply = Reply.new(post_id: params[:post_id])   
    end  

    @path = [@post, @reply] 
  end

  def create
    if params[:reply][:parent_id].to_i > 0
      parent = Reply.find_by_id(params[:reply].delete(:parent_id))
      @reply = parent.children.build(reply_params)
      @reply.user_id = current_user.id
      @reply.post_id = parent.post_id

      @reply.save
      
    else
    @reply = current_user.replies.create(reply_params)
    end

    redirect_to_reply_if_valid('Reply has successfully been created')
  end

  def edit
    @path = @reply
  end

  def update
    @reply.update(reply_params)
    redirect_to_reply_if_valid('Reply has successfully been updated')
  end

  def destroy
    @reply.destroy
    redirect_to(post_replies_path(@post), alert: 'Reply has successfully been deleted')
  end

  private

  def find_post
    if params[:post_id]
      @post = Post.find(params[:post_id])
    elsif params[:parent_id]
      @post = Reply.find(params[:parent_id]).post
    else
      @post = @reply.post
    end
    
  end

  def find_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params[:reply].permit(:post_id, :parent_id, :body)
  end

  def redirect_to_reply_if_valid(notice)
    redirect_to_reply(notice) if @reply.valid?
  end

  def redirect_to_reply(notice)
    redirect_to(@reply, notice: notice)
  end
end
