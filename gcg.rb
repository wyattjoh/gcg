S3 = Aws::S3::Resource.new(region:"us-west-2")

class Gcg < Sinatra::Base
  post "/:username" do
    username = params[:username]

    # verify the signature
    verify_signature(username)

    # generate the svg image
    svg = GithubChart.new(user: username).svg

    # upload the object to the bucket
    obj = S3.bucket(ENV["AWS_S3_BUCKET"]).object("#{username}.svg")
    obj.put(body: svg, acl: "public-read")

    status 201
  end
end
