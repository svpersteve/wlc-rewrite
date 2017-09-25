class HackroomsController < ApplicationController
  before_action :find_hackroom, except: :index

  def index
    @hackrooms = Hackroom.all
  end

  def show
  end

  def edit
  end

  def update
    if @hackroom.update_attributes(hackroom_params)
      redirect_to @hackroom, notice: 'Hackroom updated.'
    else
      render :edit, alert: 'Sorry, something went wrong there.'
    end
  end

  def join
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
