class Menu < ActiveRecord::Base
	scope :ordering, order('position ASC') 
  belongs_to :view
  belongs_to :link
  belongs_to :page
  attr_accessible :position, :title, :view_id, :page_id, :link_id
end
