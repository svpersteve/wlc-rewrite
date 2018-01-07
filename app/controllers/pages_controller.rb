class PagesController < ApplicationController
  def home
    @upcoming_meetups = Api::Meetup.upcoming(20)
    @next_meetup = @upcoming_meetups.first unless @upcoming_meetups.empty?
  end
end
