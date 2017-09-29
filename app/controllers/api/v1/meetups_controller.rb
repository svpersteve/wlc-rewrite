class Api::V1::MeetupsController < Api::V1::BaseController
  before_action :get_meetup, except: [:index, :past_meetups]

  def index
    if request_authenticated?
      upcoming_meetups = RestClient.get "https://api.meetup.com/West-London-Coders/events?photo-host=public&page=5&key=#{ENV['MEETUP_API_KEY']}"
      meetups = ActiveSupport::JSON.decode(upcoming_meetups)
      render json: meetups.map { |m| { date: date_from(m['time']), href: "#{base_api_url}/meetups/#{m['id']}" } }
    else
      respond_401_unauthorized
    end
  end

  def show
    if request_authenticated?
      render json: {
        meetup: meetup,
        rsvps: rsvps
      }
    else
      respond_401_unauthorized
    end
  end

  private

  def get_meetup
    get_meetup = RestClient.get "https://api.meetup.com/West-london-coders/events/#{params[:id]}?&sign=true&photo-host=public&key=#{ENV['MEETUP_API_KEY']}"
    @meetup = ActiveSupport::JSON.decode(get_meetup)

    get_members = RestClient.get "https://api.meetup.com/West-london-coders/events/#{params[:id]}/rsvps?&sign=true&photo-host=public&key=#{ENV['MEETUP_API_KEY']}"
    @rsvps = ActiveSupport::JSON.decode(get_members)
  end

  def meetup
    {
      date: date_from(@meetup['time']),
      timestamp: @meetup['time']
    }
  end

  def rsvps
    @rsvps.map { |r|
      {
        name: r['member']['name'],
        id: r['member']['id'],
        created_at: date_from(r['created']),
        created: r['created'],
        response: r['response'],
        guests: r['guests'],
        photo_thumb: r['member']['photo']['thumb_link'],
        photo_link: r['member']['photo']['photo_link']
      }
    }
  end

  def date_from(time)
    seconds = (time.to_f / 1000).to_s
    date = Date.strptime(seconds, '%s')
    date.strftime("%A #{date.day.ordinalize} %B")
  end
end
