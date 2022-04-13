require "faraday"
require "json"

require_relative "vimeo/version"

module Vimeo

  autoload :Client, "vimeo/client"
  autoload :Collection, "vimeo/collection"
  autoload :Error, "vimeo/error"
  autoload :Resource, "vimeo/resource"
  autoload :Object, "vimeo/object"

  autoload :VideosResource, "vimeo/resources/videos"

  autoload :Video, "vimeo/objects/video"

end
