module SessionsHelper
	def vk_auth
		if !current_user.nil? && session[:token].nil?
			render :partial => 'modules/vk_auth_error'		
		end
	end

	def vk_info
		doc = Nokogiri::XML(open("https://api.vkontakte.ru/method/getProfiles.xml?uid=#{session[:vk_id]}&access_token=#{session[:token]}&fields=photo,nickname,city,country"))
		@uid = doc.css("user uid").map {|node| node.children.text }
		@first_name = doc.css("user first_name").map {|node| node.children.text }
		@last_name = doc.css("user last_name").map {|node| node.children.text }
		@photo = doc.css("user photo").map {|node| node.children.text }
		@nickname = doc.css("user nickname").map {|node| node.children.text }
		# @country = doc2.css("country name").map {|node| node.children.text }
		render :partial => 'modules/vk_info'
	end
end
