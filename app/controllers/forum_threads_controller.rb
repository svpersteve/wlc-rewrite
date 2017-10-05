class ForumThreadsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_member!
  before_action :set_forum_thread, except: [:index, :new, :create]

  def index
    @q = ForumThread.search(params[:q])
    @q.sorts = 'created_at desc'
    @forum_threads = @q.result(distinct: true)
  end

  def show
    @forum_post = ForumPost.new
    @visit = ForumThreadVisit.find_or_create_by!(member: current_member, forum_thread: @forum_thread)
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def create
    @forum_thread = current_member.forum_threads.new forum_thread_params
    @forum_thread.forum_posts.first.member_id = current_member.id

    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
  end

  def destroy
    if @forum_thread.destroy
      redirect_to forum_threads_path, notice: 'Post deleted.'
    else
      render :show, alert: 'Sorry, something went wrong there.'
    end
  end

  private

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    def forum_thread_params
      params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
    end
end
