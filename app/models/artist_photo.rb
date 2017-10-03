class ArtistPhoto < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :photo, ArtistPhotoUploader

	belongs_to :artist
	belongs_to :artist_photo_albums

	before_save :should_generate_new_friendly_id?, if: :title_changed?

	private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
