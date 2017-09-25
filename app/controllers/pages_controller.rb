class PagesController < ApplicationController
  def home
    get_meetups
  end

  private

  def get_meetups
    request = RestClient.get "https://api.meetup.com/West-London-Coders/events?photo-host=public&page=1&sig_id=202775078&sig=7106b5f894f37222f896b703e3a9c6e95f5a65a4"
    @next_meetup = ActiveSupport::JSON.decode(request).first
  end
end
