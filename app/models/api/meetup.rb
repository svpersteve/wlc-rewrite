class Api::Meetup
  class << self
    def find(id)
      request = RestClient.get(meetup_base_url + "events/#{id}?&sign=true&photo-host=public&key=#{ENV['MEETUP_API_KEY']}")
      meetup = convert_to_json(request)
      new(meetup)
    end

    def rsvps_for(id)
      request = RestClient.get(meetup_base_url + "events/#{id}/rsvps?&sign=true&photo-host=public&key=#{ENV['MEETUP_API_KEY']}")
      members = convert_to_json(request)
      members.map { |member| Api::Member.new(member['member']) }
    end

    def upcoming(amount)
      meetup_api_events(amount, 'upcoming', 'false')
    end

    def past(amount)
      meetup_api_events(amount, 'past', 'true')
    end

    private

    def meetup_base_url
      "https://api.meetup.com/West-london-coders/"
    end

    def convert_to_json(request)
      ActiveSupport::JSON.decode(request)
    end

    def meetup_api_events(pages, status, desc)
      request = RestClient.get(meetup_base_url + "events?photo-host=public&status=#{status}&desc=#{desc}&page=#{pages}&sig=d15e960c8637ee4a358560b3e4c16e04743b383b&key=#{ENV['MEETUP_API_KEY']}")
      convert_to_json(request)
    end
  end

  def initialize(meetup)
    @meetup = meetup
  end

  attr_reader :meetup

  def id
    meetup['id']
  end

  def description
    meetup['description']
  end

  def date
    meetup['time']
  end

  def title
    meetup['name']
  end

  def url
    meetup['link']
  end

  def venue_name
    meetup['venue']['name']
  end

  def address
    meetup['venue']['address_1'].gsub(', London', '')
  end

  def rsvp_count
    meetup['yes_rsvp_count']
  end
end
