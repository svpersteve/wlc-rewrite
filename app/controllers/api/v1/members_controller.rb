class Api::V1::MembersController < Api::V1::BaseController
  before_action :find_member, except: :index

  def index
    render json: Member.all.map { |m| {name: m.name, href: "#{base_api_url}/members/#{m.id}"} }
  end

  def show
    if request_authenticated?
      render json: {
        basic_info: basic_info,
        private_info: private_info,
        interests: interests,
        notes: "#{base_api_url}/members/#{@member.id}/notes"
      }
    else
      render json: {
        basic_info: basic_info,
        interests: interests
      }
    end
  end

  def notes
    if request_authenticated?
      render json: {
        member: @member.name,
        href: "#{base_api_url}/members/#{@member.id}",
        notes: @member.notes
      }
    else
      respond_401_unauthorized
    end
  end

  def update
    if request_authenticated?
      if @member.update_attributes(member_params)
        render status: 200, json: {
          message: "Successfully updated",
          member: @member
        }.to_json
      else
       render status: 422, json: {
        message: @member.errors,
        member: @member
      }.to_json
      end
    else
      respond_401_unauthorized
    end
  end

  private

  def member_params
    params[:member].permit(:name, :username, :city, :bio, :image, :twitter, :instagram, :github, :facebook, :linkedin, :email, interest_ids: [])
  end

  def find_member
    @member = Member.find(params[:id]) if params[:id]
    @member = Member.find(params[:member_id]) if params[:member_id]
  end

  def basic_info
    {
      name: @member.name,
      city: @member.city,
      bio: @member.bio,
      image: @member.image,
      twitter: @member.twitter,
      github: @member.github
    }
  end

  def private_info
    {
      email: @member.email,
      admin: @member.admin
    }
  end

  def interests
    @member.interests.map { |i| { name: i.name, href: "#{base_api_url}/hackrooms/#{i.id}"} }
  end
end
