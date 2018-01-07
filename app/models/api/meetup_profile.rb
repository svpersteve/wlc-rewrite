class Api::MeetupProfile
  class << self
    def find(id)
      request = RestClient.get("https://api.meetup.com/2/member/#{id}?&sign=true&photo-host=public&page=20&key=#{ENV['MEETUP_API_KEY']}")
      meetup_profile = convert_to_json(request)
      new(meetup_profile)
    end

    private

    def convert_to_json(request)
      ActiveSupport::JSON.decode(request)
    end
  end

  def initialize(meetup_profile)
    @meetup_profile = meetup_profile
  end

  attr_reader :meetup_profile

  def topics
    meetup_profile['topics']
  end

  def services
    meetup_profile['other_services']
  end
end
