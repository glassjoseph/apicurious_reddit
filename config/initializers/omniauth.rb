Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, ENV['reddit_key'], ENV['reddit_secret'], scope: 'identity'
end
