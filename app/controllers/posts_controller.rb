class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(updated_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
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
    redirect_to posts_url
    flash[:notice] = t('flash.destroyed')
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :body_markdown,
                                 :picture, :picture_cache,
                                 :document, :document_cache,
                                 :remove_picture, :remove_document)
  end
end
