# frozen_string_literal: true

module Api
  module Spotify
    module V1
      class AlbumsController < ApplicationController
        def show
          spotify_albums = ::Spotify::Album.new

          render json: { data: spotify_albums.find(params[:id]) }
        end
      end
    end
  end
end
