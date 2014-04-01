CarrierWave.configure do |config| 
  config.fog_credentials = { 
    :provider               => 'AWS', 
    :aws_access_key_id      => ENV['CTKEY'], 
    :aws_secret_access_key  => ENV['CTSECRET']
  } 
  config.fog_directory  = 'joe_first_bucket/chartertracker' 
  config.fog_public     = false

  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
 
  config.fog_directory    = ENV['CTBUCKET']
  # config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  # config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
end 