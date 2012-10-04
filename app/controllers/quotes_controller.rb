class QuotesController < ApplicationController
	protect_from_forgery
	before_filter :find_quotes, :only => :index
	add_breadcrumb I18n.t("breadcrumbs.quotes"), :quotes_path

	def index
		add_breadcrumb @quotes_category.title, section_quotes_path(@quotes_category)
		# @quotes = Quote.where('category_id = ?', @quotes_category.id).page(params[:page]).per(10)
		# @q_count = Quote.where(category_id: params[:category_id]).count(group: :category_id)
		@quotes = @quotes_category.quotes.page(params[:page]).order('created_at DESC')
		@q_count = @quotes.count
	end

	def find_quotes
		@quotes_category = Section.find(params[:section_id])
	end

	def all
		@quotes = Quote.page(params[:page]).order('created_at DESC')
		if @quotes.author.nil?
			@quotes.author = 'Без автора'
		end
		@q_count = @quotes.count
		# @quotes = @quote.page(params[:page]).order('created_at DESC')
	end

	def show
		@quote = Quote.find(params[:id])
	end
end
