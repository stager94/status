class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :category
  before_filter :set_initial_breadcrumbs

  def index
  	@pages = Page.favourite
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    
    # I18n.locale = params[:locale] || 'ru'
  end

  def category
  	@category = Category.ordering
  end

  def set_initial_breadcrumbs
    add_breadcrumb I18n.t("breadcrumbs.home"), :root_path
  end

end
