# frozen_string_literal: true

module Spotify
  class Client
    API_ENDPOINT = "https://api.spotify.com"

    def initialize
      authenticator.authenticate! unless authenticator.auth?
    end

    def get(path, params)
      request(method: :get, path: path, params: params)
    end

    private

      def request(method:, path:, params: nil)
        params = (params || {}).to_json unless method.to_s == "get"

        result = client.send(method, path, params)

        Spotify::Response.new(result.body).response
      end

      def headers
        {
          "Authorization": "Bearer #{authenticator.token}"
        }
      end

      def client
        @client ||= Faraday.new(url: API_ENDPOINT) do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.headers.merge!(headers)
        end
      end

      def authenticator
        @authenticator ||= Spotify::Authentication.new
      end
  end
end
