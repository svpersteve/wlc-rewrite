class Api::V1::HackroomsController < Api::V1::BaseController
  before_action :find_hackroom, except: :index

  def index
    render json: Hackroom.all.map { |m| {name: m.name, href: "#{base_api_url}/hackrooms/#{m.id}"} }
  end

  def show
    render json: {
      name: @hackroom.name,
      description: @hackroom.description,
      long_description: @hackroom.long_description,
      slack_channel: @hackroom.slack,
      image: @hackroom.image,
      colour: @hackroom.colour,
      leaders: leaders
    }
  end

  def update
    if request_authenticated?
      if @hackroom.update_attributes(hackroom_params)
        render status: 200, json: {
          message: "Successfully updated",
          hackroom: @hackroom
        }.to_json
      else
       render status: 422, json: {
        message: @hackroom.errors,
        hackroom: @hackroom
      }.to_json
      end
    else
      respond_401_unauthorized
    end
  end

  private

  def find_hackroom
    @hackroom = Hackroom.find(params[:id])
  end

  def hackroom_params
    params.require(:hackroom).permit(:name, :description, :long_description, :colour, :slack)
  end

  def leaders
    @hackroom.leaders.map { |l| { name: l.name, href: "#{base_api_url}/members/#{l.id}"} }
  end
end
