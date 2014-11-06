class Service::Uploader
  def initialize()
  end

  def metadata(type)
    render json: {
      policy: s3_upload_policy_document,
      # Key which will be used later in amazon xml response
      key: "uploads/#{type}/#{SecureRandom.uuid}__#{params[:doc][:title]}",
      signature: s3_upload_signature,
      access_key: ENV['AWS_ACCESS_KEY_ID']
    }
  end

  def s3_upload_policy_document
    # When sending a file with IE, the key x-requested-with is autmatically added in the request header, so we add this value in the policy otherwise
    # Amazon will reject the file because the policy doesn't expect such a field (error: extra input field x-requested-with)

    Base64.encode64(
    {
      expiration: 30.minutes.from_now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z'),
      conditions: [
        { bucket: ENV['S3_BUCKET'] },
        { acl: 'private' },
        ["starts-with", "$key", "uploads/"],
        { success_action_status: '201' }
      ]
      }.to_json
      ).gsub(/\n|\r/, '')
  end

  def s3_upload_signature
    Base64.encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'),
        ENV['AWS_SECRET_ACCESS_KEY'],
        s3_upload_policy_document
        )
      ).gsub(/\n/, '')
  end
end