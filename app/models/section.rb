class Section < ActiveRecord::Base
	has_many :quotes
  attr_accessible :title
end
