class HackroomsController < ApplicationController
  skip_authorization_check
  before_action :find_hackroom, except: :index

  def index
    authorize! :read, Hackroom
    @hackrooms = Hackroom.all
  end

  def show
    authorize! :read, @hackroom
  end

  def edit
    authorize! :edit, @hackroom
  end

  def members
    authorize! :read, @hackroom
  end

  def update
    authorize! :update, @hackroom
    if @hackroom.update_attributes(hackroom_params)
      redirect_to @hackroom, notice: 'Hackroom updated.'
    else
      render :edit, alert: 'Sorry, something went wrong there.'
    end
  end

  def join
    authorize! :join, @hackroom
    interest = current_member.member_interests.where(interest: @hackroom).first
    if interest
      interest.destroy
      render :show
    else
      current_member.member_interests.create(interest: @hackroom)
      render :show
    end
  end

  private

  def find_hackroom
    @hackroom = Hackroom.friendly.find(params[:id])
  end

  def hackroom_params
    params.require(:hackroom).permit(:name, :description, :long_description, :colour, :slack)
  end
end
