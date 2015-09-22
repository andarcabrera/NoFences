 class ChainsController < ApplicationController
  def index
  end

  def show
      @chain = Chain.find(params[:id])
      @post = Post.find(params[:post_id])
      if request.xhr?
      puts "HERE" * 100
      p params
      p @chain
      render :show, locals: {chain: @chain }, :layout => false
    else
      p "FAIL" * 100

    end
  end

  def new
    @category = Category.find(params[:category_id])
     "HERE" * 100
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
