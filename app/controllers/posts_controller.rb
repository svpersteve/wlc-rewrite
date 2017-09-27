class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def show
    @more_stories = Post.take(3)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_member

    if @post.save
      redirect_to @post, notice: 'Post saved'
    else
      render :new, notice: 'Sorry, something went wrong there.'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, notice: 'Post saved'
    else
      render :new, notice: 'Sorry, something went wrong there.'
    end
  end

  private

  def find_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
