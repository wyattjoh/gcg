
# gcg

This application will generate a Github contribution graph and upload the result
to Amazon S3.

## Installing

```sh
bundle install
```

## Configuration

- `AWS_ACCESS_KEY_ID` - Your AWS Access Key ID
- `AWS_SECRET_ACCESS_KEY` - Your AWS Access Key
- `AWS_S3_BUCKET` - Your AWS Bucket to store the results
- `SECRET_TOKEN` - A random string that is used for token signing

## Setup

To start using gcg, you need to create a signature for the user account you want
to generate a graph for:

```sh
rake sign <username>
```

Which will output a signature that we'll use to authenticate the requests. Then
you just need to deploy your application, and submit your request as:

```sh
curl -XPOST <your url>/<github username>?sha=<your signature>
```

Which should upload the generated SVG to S3.