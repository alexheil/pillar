class ArtistItem < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged

	belongs_to :artist

  #before_save :total_price_calculator
  before_save :should_generate_new_friendly_id?, if: :title_changed?

  def options_for_merch
    if self.options.include? ","
      self.options.split(/\s*,\s*/)
    else
      [self.options]
    end
  end

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

    def total_price_calculator
      self.total_price = base_price + shipping_price
    end
    
end
