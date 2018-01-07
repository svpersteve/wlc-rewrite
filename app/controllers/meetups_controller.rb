class MeetupsController < ApplicationController
  before_action :find_meetup, only: [:show, :badges]

  def index
    @meetups = Api::Meetup.upcoming(20)
    redirect_if_no_meetups_scheduled
    @last_six_past_meetups = Api::Meetup.past(6)
  end

  def badges
    @no_layout = true
  end

  def past_meetups
    @all_past_meetups = Meetup.past(200)
  end

  private

  def redirect_if_no_meetups_scheduled
    redirect_to 'https://www.meetup.com/West-London-Coders/events' if @meetups.nil?
  end

  def find_meetup
    @meetup = Api::Meetup.find(params[:id])
    @members = Api::Meetup.rsvps_for(params[:id])
  end
end
