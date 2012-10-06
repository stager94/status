class Quote < ActiveRecord::Base
  belongs_to :user
  belongs_to :section
  attr_accessible :author, :content, :user_id, :section_id

  validates :content, :length => {:minimum => 10}
end
