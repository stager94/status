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
		if current_user.nil?
			render :partial => "modules/authorization"
		else
			render :partial => "modules/logout"
			
		end
	end

  def page_title
    (@content_for_title + " - " if @content_for_title).to_s + @site_name
  end

  def custom_country_options
    countries = ActionView::Helpers::FormOptionsHelper::COUNTRIES.map do |c|
      [c.downcase, c, {:"country-code" => c[0..1]}]
      #=> ["algeria", "Algeria", "Al"] 
    end

    return options_for_select(countries)
  end

  def copyright
  	render :partial => "modules/copyright"
  end

  def online_list
  	@online = User.online
  	@online_count = User.online.count

  	render :partial => 'modules/online'
  end

  def last_requested_at(time, sex)
		if sex == 1
			return "#{t('profile.come')} #{time_ago_in_words(time, true)} #{t('profile.ago')}"
		else
			return "#{t('profile.come_female')} #{time_ago_in_words(time, true)} #{t('profile.ago')}"
		end
  end

  def re_sex(sex)
  	if sex == 0
  		return "#{t('profile.female')}"
  	else
  		return "#{t('profile.male')}"
  	end
  end

  def resection(section)
    @section = Section.find(section)
    return @section.title
  end
end
