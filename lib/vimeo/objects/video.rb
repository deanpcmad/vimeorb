module Vimeo
  class Video < Object

    def initialize(options = {})
      super options

      self.id = options["uri"].gsub("/videos/", "")
    end

  end
end
