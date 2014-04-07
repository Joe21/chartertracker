CarrierWave.configure do |config| 
  config.fog_credentials = { 
    :provider               => 'AWS', 
    :aws_access_key_id      => ENV['CTKEY'], 
    :aws_secret_access_key  => ENV['CTSECRET']
  } 
  config.fog_public     = false
  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
 
  config.fog_directory    = ENV['CTBUCKET']
end 