class Api::Member
  class << self
    def find(id)
      request = RestClient.get(meetup_base_url + "members/#{id}?&sign=true&photo-host=public&key=#{ENV['MEETUP_API_KEY']}")
      member = convert_to_json(request)
      new(member)
    end

    private

    def meetup_base_url
      "https://api.meetup.com/West-london-coders/"
    end

    def convert_to_json(request)
      ActiveSupport::JSON.decode(request)
    end
  end

  def initialize(member)
    @member = member
  end

  attr_reader :member

  def id
    member['id']
  end

  def profile_url
    "https://www.meetup.com/West-London-Coders/members/#{id}"
  end

  def image
    member['photo']
  end

  def thumbnail_image
    image['thumb_link']
  end

  def name
    member['name']
  end

  def role
    member['role']
  end
end
