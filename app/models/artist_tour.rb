class ArtistTour < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :artist
  has_many :artist_shows, dependent: :destroy

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end
end
