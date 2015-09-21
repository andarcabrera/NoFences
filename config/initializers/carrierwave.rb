CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      'AKIAIMVRLWZBMWOYM43Q',
    aws_secret_access_key:  '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',
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage           = :file
    config.enable_processing = false
    config.root              = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.cache_dir        = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on Heroku
  config.fog_directory    = ENV['S3_BUCKET_NAME']
end