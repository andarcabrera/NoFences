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
    if request.xhr?
      if @post.save
        @category.posts << @post
        render partial: "categories/single_post_listing", locals: { post: @post }
      else
        render :status => 400
      end
    else
      redirect_to category_path(@category)
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
    @post = Post.find(params[:id])
    @post.destroy
    @category = Category.find(params[:category_id])
    redirect_to category_path(@category)
  end


private
  def post_params
    params.require(:post).permit(:title, :body, :zip, :category_id, :volunteer)
  end
end
