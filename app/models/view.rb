class View < ActiveRecord::Base
	has_many :menus
  attr_accessible :code, :title
end
