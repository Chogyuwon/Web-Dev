CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:   #본인의  AWS S3 id '***********',                        # required
    aws_secret_access_key:#본인의 AWS S3 key '**********',                        # required
    region:                'ap-northeast-2',             # optional, defaults to 'us-east-1'
    endpoint:        'https://s3.ap-northeast-2.amazonaws.com'
  }
  config.fog_directory  = #본인의 AWS S3 bucket 이름 'nolnol'            # required
end
