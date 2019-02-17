# frozen_string_literal: true

module Spotify
  class Response
    attr_reader :response

    def initialize(body)
      response = JSON.parse(body)
                     .deep_transform_keys { |key| key.to_s.underscore }

      @response = OpenStruct.new(response)
    end
  end
end
