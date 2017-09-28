class Fan < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9 ]+\Z/i }, :case_sensitive => false
  validate :validate_username

  has_one :fan_profile
  has_one :fan_location
  has_one :fan_theme

  has_many :artist_relationships, dependent: :destroy
  has_many :artists, through: :artist_relationships
  belongs_to :artist

  before_save :should_generate_new_friendly_id?, if: :username_changed?
  before_save :downcase_username

  def validate_username
    if Fan.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
  
  def following_artist?(artist)
    ArtistRelationship.exists? fan_id: id, artist_id: artist.id
  end

  def unfollow_artist(artist)
    ArtistRelationship.find_by(fan_id: id, artist_id: artist.id).destroy
  end

  def artist_relationship_id(artist)
    ArtistRelationship.find_by(fan_id: id, artist_id: artist.id).id
  end

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
