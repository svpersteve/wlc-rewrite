class ForumPostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_member!
  before_action :set_forum_thread
  before_action :find_forum_post, only: [:edit, :update, :like]

  def create
    @forum_post = @forum_thread.forum_posts.new forum_post_params
    @forum_post.member = current_member

    if @forum_post.save
      redirect_to forum_thread_path(@forum_thread, anchor: "forum_post_#{@forum_post.id}"), notice: "Post saved!"
    else
      redirect_to @forum_thread, alert: "Sorry, something went wrong there."
    end
  end

  def show
    redirect_to forum_threads_path if @forum_thread.forum_posts.empty?
  end

  def update
    if @forum_post.update_attributes(forum_post_params)
      redirect_to @forum_thread, notice: 'Post updated!'
    else
      render :edit, alert: 'Sorry, something went wrong there.'
    end
  end

  def destroy
    if @forum_post.destroy
      redirect_to @forum_thread, notice: 'Post deleted.'
    else
      redirect_to @forum_thread, alert: 'Sorry, something went wrong there.'
    end
  end

  def like
    if @forum_post.liked_by(current_member)
      ForumPostLike.find_by(member: current_member, forum_post: @forum_post).destroy
    else
      ForumPostLike.create!(member: current_member, forum_post: @forum_post)
    end
    render :forum_post
  end

  private

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:forum_thread_id])
  end

  def forum_post_params
    params.require(:forum_post).permit(:body)
  end

  def find_forum_post
    @forum_post = ForumPost.find(params[:id])
  end
end
