class MembersController < ApplicationController
  def show
    find_member
    find_meetup_account
  end

  private

  def find_member
    @member = Api::Member.find(params[:id])
  end

  def find_meetup_account
    @meetup_profile = Api::MeetupProfile.find(params[:id])
  end
end
