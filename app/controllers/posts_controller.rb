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

  # def create
  #   @category = Category.find(params[:category_id])
  #   @post = current_user.posts.new(post_params)
  #   if @post.save
  #     @category.posts << @post
  #     if request.xhr?
  #       @post
  #     else
  #       redirect_to category_path(@category)
  #     end
  #   else
  #     render 'new'
  #   end
  # end

  def create
    @category = Category.find(params[:category_id])
    @post = current_user.posts.new(post_params)
    if request.xhr?
      if @post.save
        @category.posts << @post
        redirect_to root_url
      else
        render :status => 400
      end
    else
      #DO SOMETHING IF NOT AN AJAX REQUEST
      redirect_to root_url
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
