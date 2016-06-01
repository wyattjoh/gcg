def create_signature(username)
  return OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha1"), ENV["SECRET_TOKEN"], username)
end

def verify_signature(username)
  return halt 500, "Signatures did not match!" unless Rack::Utils.secure_compare(create_signature(username), params[:sha1].to_s)
end
