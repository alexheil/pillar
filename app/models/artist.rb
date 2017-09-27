class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9 ]+\Z/i }, :case_sensitive => false
  validate :validate_username

  has_one :artist_profile, dependent: :destroy
  has_one :artist_genre, dependent: :destroy
  has_one :artist_location, dependent: :destroy
  has_one :artist_theme, dependent: :destroy
  has_many :artist_members, dependent: :destroy
  #has_many :artist_photos, dependent: :destroy
  #has_many :artist_videos, dependent: :destroy
  has_many :artist_posts, dependent: :destroy
  #has_many :artist_tours, dependent: :destroy
  #has_many :artist_shows, dependent: :destroy
  #has_one :artist_store, dependent: :destroy
  #has_many :artist_items, dependent: :destroy
  #has_many :artist_albums, dependent: :destroy
  #has_many :artist_tracks, dependent: :destroy

  has_many :artist_relationships, dependent: :destroy
  has_many :fans, through: :artist_relationships
  belongs_to :fan

  before_save :should_generate_new_friendly_id?, if: :username_changed?
  before_save :downcase_username

  def validate_username
    if Artist.where(email: username).exists?
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

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
