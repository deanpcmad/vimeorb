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

    # Upload a new Video
    # Uses the Resumable Upload feature - https://developer.vimeo.com/api/upload/videos#resumable-approach
    # It splits the file up into 128MB chunks and uploads them until complete
    def upload(file:, debug: false)
      tus = post_request("me/videos", body: {upload: {approach: 'tus', size: file.size.to_s}})

      headers = {'Content-Type' => 'application/offset+octet-stream'}
      headers['Tus-Resumable'] = '1.0.0'
      headers['Upload-Offset'] = '0'
      file.rewind

      # 128MB
      split = 128000000

      begin
        video_content = file.read(split)
        @response = patch_request(tus.body["upload"]["upload_link"], body: video_content, headers: headers)
        
        offset = @response.headers['upload-offset']
        headers['Upload-Offset'] = offset 
        
        if debug
          puts "* #{offset}/#{file.size}"
        end
      end while offset.to_i != file.size

      Video.new(tus.body)
    end

  end
end
