Rails.application.config.middleware.use OmniAuth::Builder do
  if ENV['MONTREALRB_CONSUMER_KEY'].blank? || ENV['MONTREALRB_CONSUMER_SECRET'].blank?
    raise "Environment keys are not loaded"
  end

  provider :twitter, ENV['MONTREALRB_CONSUMER_KEY'], ENV['MONTREALRB_CONSUMER_SECRET']
end
