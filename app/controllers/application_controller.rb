class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :category
  before_filter :set_initial_breadcrumbs
  before_filter :site_config
  # require 'localized_country_select' 
  def index
  	@pages = Page.favourite
    vk = VkontakteApi::Client.new(session[:token])
    
    if !current_user.nil?
      # сначала создадим клиент API
      
      vk = VkontakteApi::Client.new(session[:token])

      # session[:state] = Digest::MD5.hexdigest(rand.to_s)
      # @vk = VkontakteApi.authorize(code: params[:code])
      # session[:state] = Digest::MD5.hexdigest(rand.to_s)
      # redirect_to VkontakteApi.authorization_url(scope: [:notify, :friends, :photos], state: session[:state])
      # app.access_token = 'ad'
      # vk.wall.savePost(:message => 'test text')
      @user = vk.users.get(uid: "#{current_user.vk.split("/")[3]}", fields: [:screen_name, :photo]).first
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
  end

end
