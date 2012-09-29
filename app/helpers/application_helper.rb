module ApplicationHelper
	def statistic
		@users_today_count = User.find(:all, :conditions => ["DATE(created_at) = ?", Date.today]).count
		@users_yesterday_count = User.find(:all, :conditions => ["DATE(created_at) = ?", Date.today-1]).count
		@users_count = User.all.count

		@quotes_today_count = Quote.find(:all, :conditions => ["DATE(created_at) = ?", Date.today]).count
		@quotes_yesterday_count = Quote.find(:all, :conditions => ["DATE(created_at) = ?", Date.today-1]).count
		@quotes_count = Quote.find(:all).count
	
		render :partial => "modules/statistic", users_today_count: @users_today_count, userss_count: @userss_count, users_yesterday_count: @users_yesterday_count, quotes_today_count: @quotes_today_count, quotes_count: @quotes_count, quotes_yesterday_count: @quotes_yesterday_count
	end

	def menu
		@menus = Menu.ordering
		render :partial => "modules/menu"
	end

	def authorization
		# if current_user.nil?
			render :partial => "modules/authorization"		
		# end
	end
end
