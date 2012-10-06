class VkController < ApplicationController
	def set_status
		
		@result = Nokogiri::HTML(open("https://api.vk.com/method/status.set?text=#{text}&access_token=#{session[:token]}"))
		redirect_to section_quote_path(section_id, quote_id)
	end
end
