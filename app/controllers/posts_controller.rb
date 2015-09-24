class PostsController < ApplicationController
  def index
    if request.xhr?
      if @posts = Post.search(params[:search]).where(category_id: params[:category_id])
        p "#{params[:category_id]}" *100
        render partial: 'post_search_results', layout: false, locals: { post: @posts }
      else
        p "ERROR #{@posts}" * 100
      end
    else
      @posts = Post.all
    end
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
    if request.xhr?
      if @post.update_attributes(post_params)
        @category = Category.find(params[:category_id])
        render partial: "posts/post_details", locals: { post: @post }
      else
        render :status => 400
      end
    else
      redirect_to category_path(@category)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @category = Category.find(params[:category_id])
    redirect_to category_path(@category) unless request.xhr?
  end


private
  def post_params
    params.require(:post).permit(:title, :body, :zip, :category_id, :volunteer)
  end
end
