class Page < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	scope :favourite, where(:active => true, :favourite => true)
	has_many :menus
  attr_accessible :active, :content, :favourite, :title, :slug

  def should_generate_new_friendly_id?
    new_record?
  end
end
