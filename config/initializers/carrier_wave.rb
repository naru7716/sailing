if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],
      :aws_access_key_id     => ENV['AKIA5PKNPFC2ZAXQXCW4'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['sailing7716']
  end
end