class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :category
  before_filter :set_initial_breadcrumbs
  before_filter :site_config
  before_filter :requested
  before_filter :get_name
  # require 'localized_country_select' 
  def index
  	@pages = Page.favourite
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    
    # I18n.locale = params[:locale] || 'ru'
  end

  def category
  	@category = Section.find(:all)
  end

  def set_initial_breadcrumbs
    add_breadcrumb I18n.t("breadcrumbs.home"), :root_path
  end

  def site_config
    @site_name = t('config.site_name')
  end

  def requested
    if !current_user.nil?
      current_user.last_requested_at = Time.now.utc
      current_user.online = true
      current_user.save
    end
  end

  def get_name
    if !current_user.nil? && !session[:token].nil? && !session[:vk_id].nil?
      if session[:checking] != true
        doc = Nokogiri::XML(open("https://api.vkontakte.ru/method/getProfiles.xml?uid=#{session[:vk_id]}&access_token=#{session[:token]}&fields=photo,nickname,city,country"))
        @first_name = doc.css("user first_name").map {|node| node.children.text }
        @last_name = doc.css("user last_name").map {|node| node.children.text }
        @uid = doc.css("user uid").map {|node| node.children.text }
        
        if current_user.vk.nil? || current_user.last_name.nil? || current_user.first_name.nil?  
          current_user.first_name = @first_name[0]
          current_user.last_name = @last_name[0]
          current_user.vk = @uid[0]
          current_user.save
        end

        if current_user.vk != @uid[0]
          current_user.vk = @uid[0]
          current_user.save
        end

        if current_user.last_name != @last_name[0] || current_user.first_name != @first_name[0]
          current_user.last_name = @last_name[0]
          current_user.first_name = @first_name[0]
          current_user.save
        end 

      end
    session[:checking] = true
    end
  end


end