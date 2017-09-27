class ArtistPost < ApplicationRecord
	belongs_to :artist

	default_scope -> { order('id DESC') }
	
end
