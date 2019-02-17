# frozen_string_literal: true

module Spotify
  class Home
    def home
      Spotify::Client.new.get("v1/views/web-player-home", params)
    end

    def params
      @params ||= {
        platform: "web",
        content_limit: 12,
        limit: 10,
        types: "album,playlist,artist,show,station",
        image_style: "gradient_overlay",
        country: "US",
        market: "US",
        locale: "en"
      }
    end
  end
end
