class MembersController < ApplicationController
  load_and_authorize_resource
  before_action :find_member, except: :index

  def index
    @members = Member.all
  end

  def show
  end

  def edit
  end

  def update
    if @member.update_attributes(member_params)
      redirect_to @member, notice: 'Profile updated.'
    else
      render :edit, alert: 'Sorry, something went wrong there.'
    end
  end

  private

  def find_member
    @member = Member.friendly.find(params[:id])
  end

  def member_params
    params[:member].permit(:name, :username, :city, :bio, :image, :twitter, :instagram, :github, :facebook, :linkedin, :email, interest_ids: [])
  end
end
