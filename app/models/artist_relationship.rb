class ArtistRelationship < ApplicationRecord
	belongs_to :artist
  belongs_to :fan

  validates :artist_id, presence: true
  validates :fan_id, presence: true
end
