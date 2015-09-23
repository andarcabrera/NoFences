 class ChainsController < ApplicationController
  def index
  end

  def show
      @category = Category.find(params[:category_id])
      @chain = Chain.find(params[:id])
      @post = Post.find(params[:post_id])
      if request.xhr?
      p params
      p @chain
      render :show, locals: {chain: @chain, post: @post, category: @category }, :layout => false
    else
      p "FAIL" * 100

    end
  end

  def new
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    @chain = Chain.new
    @post.chains << @chain
    if request.xhr?
      render partial: 'messages/new_message_form', locals: { category: @category, post: @post, chain: @chain }
    else
      render 'new'
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
