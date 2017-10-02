class ArtistPhoto < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged

	belongs_to :artist
	belongs_to :artist_photo_albums

	before_save :should_generate_new_friendly_id?, if: :username_changed?

	private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
