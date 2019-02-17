# frozen_string_literal: true

module Spotify
  class Playlist
    def find(id)
      Spotify::Client.new.get("/v1/playlists/#{id}", params)
    end

    def params
      @params ||= { type: "track,episode", market: "US" }
    end
  end
end
