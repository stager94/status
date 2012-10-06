VkontakteApi.configure do |config|
  # Authorization parameters (not needed when using an external authorization): сайт
  # config.app_id       = '3157214'
  # config.app_secret   = 'lEmEQAys99NYjc6TPtOJ'
  # config.redirect_uri = 'http://mystatus.herokuapp.com/vkauth'

  # Authorization parameters (not needed when using an external authorization): локал
  config.app_id       = '3153804'
  config.app_secret   = 'QJBbxVQK17mn38cVwxPX'
  config.redirect_uri = 'http://example.com:3000/vkauth'

  # Authorization parameters (not needed when using an external authorization): локал сайт
  # config.app_id       = '3154703'
  # config.app_secret   = 'P7GSuZyKacsoHljXgyph'
  # config.redirect_uri = 'http://example.com:3000/vkauth'



  # Faraday adapter to make requests with:
  config.adapter = :net_http
  
  # HTTP verb for API methods (:get or :post)
  config.http_verb = :get
  
  # Logging parameters:
  # log everything through the rails logger
  config.logger = Rails.logger
  
  # log requests' URLs
  config.log_requests = true
  
  # log response JSON after errors
  config.log_errors = true
  
  # log response JSON after successful responses
  config.log_responses = false
end

# create a short alias VK for VkontakteApi module
# VkontakteApi.register_alias
# https://oauth.vk.com/authorize?client_id=3154703&scope=wall&redirect_uri=http://oauth.vk.com/blank.html&display=popup&response_type=token
# https://oauth.vk.com/blank.html#access_token=baeea1dae9ada840b99e03ba00b9f1a7cbbb9c1b9c1a4c4e9ab5fc0d81412ba7d63b442&expires_in=86400&user_id=53421342