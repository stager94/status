class Section < ActiveRecord::Base
	has_many :quotes
  attr_accessible :title

  def to_param
  	"#{id} #{title}".parameterize
  end
end
