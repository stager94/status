class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :category
  before_filter :set_initial_breadcrumbs
  before_filter :site_config
  # require 'localized_country_select' 
  def index
  	@pages = Page.favourite
    if !session[:token].nil?
      app = VK::Application.new access_token: session[:token]
      # app.wall.
    end
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

    # app = VK::Serverside.new app_id: '3153804', app_secret: 'QJBbxVQK17mn38cVwxPX'
    # app.authorize true
  end

end