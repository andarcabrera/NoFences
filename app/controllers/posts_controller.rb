class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @category = Category.find(params[:category_id])
    render 'show'
  end

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
    render 'new'
  end

  def create
    @category = Category.find(params[:category_id])
    @post = current_user.posts.new(post_params)
    if @post.save
      @category.posts << @post
      if request.xhr?
        @post
      else
        redirect_to category_path(@category)
      end
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def update
    @post = Post.find(params[:id])
    @category = Category.find(params[:category_id])
    if @post.update_attributes(post_params)
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
  end


private
  def post_params
    params.require(:post).permit(:title, :body, :address_1, :address_2, :city, :state, :zip, :preferred_contact, :category_id)
  end

end
