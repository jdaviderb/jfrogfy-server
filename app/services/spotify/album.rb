# frozen_string_literal: true

module Spotify
  class Album
    def find(id)
      Spotify::Client.new.get("/v1/albums/#{id}", params)
    end

    def params
      @params ||= { market: "US" }
    end
  end
end
