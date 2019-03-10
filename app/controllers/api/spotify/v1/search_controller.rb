# frozen_string_literal: true

module Api
  module Spotify
    module V1
      class SearchController < ApplicationController
        def index
          spotify_search = ::Spotify::Search.new
          render json: { data: spotify_search.search(params[:keyword]) }
        end
      end
    end
  end
end
