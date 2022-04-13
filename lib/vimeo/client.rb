module Vimeo
  class Client
    BASE_URL = "https://api.vimeo.com"

    attr_reader :access_token, :adapter

    def initialize(access_token:, adapter: Faraday.default_adapter, stubs: nil)
      @access_token = access_token
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def videos
      VideosResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, access_token
        conn.request :json

        conn.response :json

        conn.adapter adapter, @stubs
      end
    end

  end
end
