# frozen_string_literal: true

module Spotify
  class Artist
    def find(id)
      Spotify::Client.new.get("/v1/artists/#{id}", params)
    end

    def albums(artist_id)
      Spotify::Client.new.get("/v1/artists/#{artist_id}/albums", params)
    end

    def params
      @params ||= { market: "US", limit: 50 }
    end
  end
end
