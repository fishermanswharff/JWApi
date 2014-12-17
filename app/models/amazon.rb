class Amazon # no inheritance here bc this class does not connect to Postgres
  def self.get_s3_upload_key
    @bucket = ENV['S3_BUCKET_NAME']
    @access_key = ENV['AWS_ACCESS_KEY_ID']
    @secret = ENV['AWS_SECRET_ACCESS_KEY']
    @expiration = 30.minutes.from_now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z')
    @key = "uploads/#{SecureRandom.uuid}"
    @policy = Base64.encode64(
      "{'expiration': '#{@expiration}',
      'conditions': [
        {'bucket': '#{@bucket}'},
        ['starts-with', '$key', '#{@key}'],
        {'acl': 'public-read'},
        ['starts-with', '$Content-Type', 'image/jpeg'],
        ['content-length-range', 0, 10485760],
      ]}").gsub(/\n|\r/, '')
    @signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), @secret, @policy)).gsub(/\n| |\r/, '')
    return {access_key: @access_key, key: @key, policy: @policy, signature: @signature}
  end
end