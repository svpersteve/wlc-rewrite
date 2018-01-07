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

  def intro
    member['group_profile']['intro']
  end

  def profile_url
    "https://www.meetup.com/West-London-Coders/members/#{id}"
  end

  def image
    member['photo']['highres_link']
  end

  def thumbnail_image
    member['photo']['thumb_link']
  end

  def name
    member['name']
  end

  def role
    member['role']
  end

  def group_role
    member['group_profile']['role']
  end

  def city
    member['city']
  end

  def date_joined
    member['group_profile']['created']
  end

  def last_active
    member['group_profile']['visited']
  end
end
