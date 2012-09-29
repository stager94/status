class Quote < ActiveRecord::Base
	scope :categorise, where('category_id = ?', '#{@quotes_category}')
	# @quotes_category = Category.find(params[:category_id])
  belongs_to :user
  belongs_to :category
  attr_accessible :author, :content, :user_id, :section_id, :category_id
end
