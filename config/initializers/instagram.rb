require "instagram"

CALLBACK_URL = "https://realidadtangible.herokuapp.com/instagram/callback"

Instagram.configure do |config|
  config.client_id     = ENV["INSTA_CLIENT_ID"]
  config.client_secret = ENV["INSTA_SECRET"]
end