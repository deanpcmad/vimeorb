module Vimeo
  class VideosResource < Resource

    # PARTS = "id,snippet,status,statistics"

    # def list
      
    # end

    def retrieve(id:)
      response = get_request "videos/#{id}"
      #, params: {id: id, part: AUTH_PARTS}
      # return nil if response.body["pageInfo"]["totalResults"] == 0
      response
      # Video.new(response.body["app"])
    end



    # # Retrieve the channel of the currently authenticated user
    # def mine
    #   response = get_request "channels", params: {mine: true, part: PARTS}
    #   return nil if response.body["pageInfo"]["totalResults"] == 0
    #   Channel.new(response.body["items"][0])
    # end
    
    # # Retrieve a Channel by its ID or Username
    # def retrieve(id: nil, username: nil)
    #   attrs = {}
    #   attrs[:id] = id if id
    #   attrs[:forUsername] = username if username

    #   response = get_request "channels", params: attrs.merge({part: PARTS})
    #   return nil if response.body["pageInfo"]["totalResults"] == 0
    #   Channel.new(response.body["items"][0])
    # end

  end
end
