class SessionsController < ApplicationController
  def vk_code
    @code = params[:code]
    # https://oauth.vk.com/access_token?client_id=APP_ID&client_secret=APP_SECRET&code=7a6fa4dff77a228eeda56603b8f53806c883f011c40b72630bb50df056f6479e52a&redirect_uri=REDIRECT_URI& 
    @access = Nokogiri::HTML(open("https://oauth.vk.com/access_token?client_id=3155370&redirect_uri=http://example.com:3000/vkauth&client_secret=ewa7SJcfyCG8Phiey69y&code=#{@code}"))
    "https://oauth.vk.com/access_token?client_id=3155370&redirect_uri=http://example.com:3000/vkauth&client_secret=ewa7SJcfyCG8Phiey69y&code=#{@code}"
    @access.css('p').each do |link|
        @token = link.content.split(":")[1].split('"')[1]
        @id = link.content.split(":")[3].split('}')[0]
        session[:token] = @token
        session[:vk_id] = @id
    
    redirect_to root_path
    end
  end

  def vk_access
  end
end