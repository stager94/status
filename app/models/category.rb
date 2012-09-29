class Category < ActiveRecord::Base
	has_many :quotes
  attr_accessible :title
  accepts_nested_attributes_for :quotes
end
