module Vimeo
  class VideosResource < Resource

    def retrieve(id:)
      response = get_request("videos/#{id}")
      Video.new(response.body)
    end
    
    def edit(id:, **params)
      response = patch_request("videos/#{id}", body: params)
      Video.new(response.body)
    end

    def delete(id:)
      response = delete_request("videos/#{id}")
      return true if response.success
    end

  end
end
