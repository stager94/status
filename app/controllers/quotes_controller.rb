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

		@q_count = @quotes.count
		# @quotes = @quote.page(params[:page]).order('created_at DESC')
	end

	def new
		add_breadcrumb t('breadcrumbs.new_quote'), new_section_quote_path(params[:section_id])
		if !current_user.nil? && current_user.admin == true
			@quote = Quote.new
		else
			redirect_to quotes_path
		end
	end

	def create
		if !current_user.nil? && current_user.admin == true
			@quote = Quote.new(params['quote'])
			@quote.user = current_user
			@quote.section_id = params[:section_id]
			if @quote.save
				@quote = Quote.new
			end

			render :new
		else
			redirect_to quotes_path
		end
	end

	def show
		@quote = Quote.find(params[:id])
		add_breadcrumb @quote.section.title, section_quotes_path(@quote.section)
		add_breadcrumb "##{@quote.id}", section_quote_path(@quote.section, @quote)

		if @quote.author == ''
			@vk_message = @quote.content
			@note_title = t('vk.notes.missing')
		else
			@vk_message = @quote.content+' - '+@quote.author
			@note_title = @quote.author
		end
	end

	def setstatus
		@text = Quote.find(params[:id])
		@result = Nokogiri::HTML(open("https://api.vk.com/method/status.set?text=#{URI.escape(@text.content)}&access_token=#{session[:token]}"))
		redirect_to section_quote_path(params[:section_id], params[:id])
	end
end
