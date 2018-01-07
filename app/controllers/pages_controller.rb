class PagesController < ApplicationController
  def home
    @upcoming_meetups = Api::Meetup.upcoming(20)
    @next_meetup = @upcoming_meetups.first unless @upcoming_meetups.empty?
  end

  def about
    request = RestClient.get("https://api.meetup.com/West-London-Coders?photo-host=public&sig_id=202775078&sig=833335c3dbd4b9052a75f2154a784ad3c248796e&key=#{ENV['MEETUP_API_KEY']}")
    @meetup_group = convert_to_json(request)
  end

  private

  def meetup_base_url
    "https://api.meetup.com/West-london-coders/"
  end

  def convert_to_json(request)
    ActiveSupport::JSON.decode(request)
  end
end
