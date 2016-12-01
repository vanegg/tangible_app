require "instagram"

CALLBACK_URL = "https://tangible-app.herokuapp.com/instagram/callback"

Instagram.configure do |config|
  config.client_id     = ENV["INSTA_CLIENT_ID"]
  config.client_secret = ENV["INSTA_SECRET"]
end