class Member < ApplicationRecord
  has_many :member_interests, dependent: :destroy
  has_many :interests, through: :member_interests
  has_many :hackroom_leaders
  has_many :hackrooms, through: :hackroom_leaders
  has_many :notes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
      member.provider = auth.provider
      member.uid = auth.uid
      member.email = "#{auth.uid}+#{auth.provider}@changeme.com"
      member.name = auth.info.name
      member.bio = auth.info.description
      member.password = Devise.friendly_token[0, 20]
      member.image = auth.info.photo_url
      member.city = auth.extra.raw_info.city
      member.country = auth.extra.raw_info.country
      social_links = auth.extra.raw_info.other_services
      if social_links.any?
        member.twitter = social_links.twitter.identifier if social_links.twitter
        member.facebook = social_links.facebook.identifier if social_links.facebook
        member.linkedin = social_links.linkedin.identifier if social_links.linkedin
        member.instagram = social_links.instagram.identifier if social_links.instagram
      end
    end
  end

  def confirmation_required?
    false
  end

  def colour
    interests&.first&.colour || '#1446a0'
  end

  def first_name
    name.split(' ').first
  end
end
