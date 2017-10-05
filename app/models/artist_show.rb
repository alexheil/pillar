class ArtistShow < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :artist
  belongs_to :artist_tour

  has_one :artist_show_location, dependent: :destroy

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

    def independent_show
      if show.is_independent?
        
      end
    end

end
