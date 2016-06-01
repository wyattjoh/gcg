S3 = Aws::S3::Resource.new(region:"us-west-2")

class Gcg < Sinatra::Base
  enable :logging

  post "/:username" do
    username = params[:username]

    # verify the signature
    verify_signature(username)

    # generate the svg image
    svg = GithubChart.new(user: username, colors: COLOR_SCHEME).svg

    # upload the object to the bucket
    obj = S3.bucket(ENV["AWS_S3_BUCKET"]).object("#{username}.svg")
    obj.put(body: gzip(svg), acl: "public-read", content_type: "image/svg+xml", content_encoding: "gzip", cache_control: "public, max-age=3600")

    status 201
    body "OK"
  end
end
