# frozen_string_literal: true

module Spotify
  class Search
    def search(search)
      params[:q] = search
      Spotify::Client.new.get("/v1/search", params)
    end

    def params
      @params ||= {
        type: "album,artist,playlist,track,show_audio,episode_audio",
        decorate_restrictions: false,
        best_match: true,
        limit: 50,
        userless: true,
        market: "CO"
      }
    end
  end
end
