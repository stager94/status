class SessionsController < ApplicationController
  def vk_code
    @code = params[:code]
    @access = Nokogiri::HTML(open("https://oauth.vk.com/access_token?client_id=#{VkontakteApi.app_id}&redirect_uri=#{VkontakteApi.redirect_uri}&client_secret=#{VkontakteApi.app_secret}&code=#{@code}"))
    @access.css('p').each do |link|
        @token = link.content.split(":")[1].split('"')[1]
        @id = link.content.split(":")[3].split('}')[0]
        session[:token] = @token
        session[:vk_id] = @id
    redirect_to root_path
    end
    @access2 = Nokogiri::HTML(open("https://oauth.vk.com/authorize?client_id=#{VkontakteApi.app_id}&scope=wall,status,notes&redirect_uri=http://example.com:3000&response_type=token"))
  end

  def vk_access
  end
end