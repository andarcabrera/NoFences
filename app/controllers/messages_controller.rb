class MessagesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  if request.xhr?

    @post = Post.find(params[:post_id])
    @chain = Chain.find(params[:chain_id])
    @message = Message.new(message_params)
     @message.sender_id = current_user.id
    if @chain.first_message?
      @message.receiver_id = @post.author_id
    else
      if @chain.messages.last.sender_id == current_user.id
        @message.receiver_id = @chain.messages.last.receiver_id
      else
        @message.receiver_id = @chain.messages.last.sender_id
      end
    end
    @chain.messages << @message
    render partial: '/chains/single_chain_listing', locals: { chain: @chain }
  end

  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def message_params
    params.require(:message).permit(:subject, :body)
  end


end
