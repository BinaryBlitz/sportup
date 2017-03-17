CarrierWave.configure do |config|
  # Use local storage in development and test environment
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  end
end
