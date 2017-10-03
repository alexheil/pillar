class ArtistVideo < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :video, ArtistVideoUploader

	belongs_to :artist

	before_save :should_generate_new_friendly_id?, if: :title_changed?

	private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
