class Page < ActiveRecord::Base
	scope :favourite, where(:active => true, :favourite => true)
	has_many :menus
  attr_accessible :active, :content, :favourite, :title
end
