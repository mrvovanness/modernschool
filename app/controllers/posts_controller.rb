class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(updated_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
    redirect_to posts_path unless policy(@post).create?
  end

  def edit
    redirect_to posts_path unless policy(@post).update?
  end

  def create
    @post = current_user.posts.new(post_params)
    authorize @post
    if @post.save
      flash[:notice] = t('flash.success')
      redirect_to @post
    else
      render :new
    end
  end

  def update
    authorize @post
    if @post.update(post_params)
      flash[:notice] = t('flash.success')
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:notice] = t('flash.destroyed')
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body_markdown,
                                 :picture, :picture_cache,
                                 :document, :document_cache,
                                 :remove_picture, :remove_document)
  end
end
