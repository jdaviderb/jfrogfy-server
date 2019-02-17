# frozen_string_literal: true

module Spotify
  class Authentication
    attr_reader :token

    def authenticate!
      agent.get("https://open.spotify.com/browse/featured")

      raise "cookie wp_access_token is empty" unless access_token

      Spotify::TokenManager.token = access_token
      true
    end

    def auth?
      token.present?
    end

    def token
      Spotify::TokenManager.token
    end

    private
      def access_token
        agent.cookies.detect { |cookie| cookie.name == "wp_access_token" }
                     &.value
      end

      def agent
        @agent ||= Mechanize.new

        @agent.user_agent = user_agent

        @agent
      end

      def user_agent
        @user_agent ||= "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) " +
          "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36"
      end
  end
end
