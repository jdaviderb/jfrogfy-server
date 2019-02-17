# frozen_string_literal: true

module Spotify
  class TokenManager
    TOKEN_KEY = "SPOTIFY_TOKEN"
    TOKEN_EXPIRE = 5.minutes

    class << self
      def token
        Rails.cache.fetch(TOKEN_KEY)
      end

      def token=(token)
        Rails.cache.fetch(TOKEN_KEY, expires_in: TOKEN_EXPIRE) { token }
      end
    end
  end
end
