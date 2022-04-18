# VimeoRB

**This library is a work in progress**

VimeoRB is a Ruby library for interacting with the Vimeo v3.4 API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vimeorb'
```

## Usage

### Set Client Details

Firstly you'll need to set an Access Token. 
An Access Token will be an OAuth2 token generated after authentication. 

```ruby
@client = Vimeo::Client.new(access_token: "")
```

### Videos

```ruby
# Retrieve a Video's details
@client.videos.retrieve(id: "abc123")

# Edit a Video
params = {title: "New Title"}
@client.videos.edit(id: "abc123", params)

# Delete a Video
@client.videos.delete(id: "abc123")

# Upload a Video using resumable uploads
# This splits the file into 128MB chunks while uploading
@client.videos.upload(file: File.new("my_video.mp4"))
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/vimeorb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
