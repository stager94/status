class Category < ActiveRecord::Base
	scope :ordering
	has_many :quotes
  attr_accessible :title
end
