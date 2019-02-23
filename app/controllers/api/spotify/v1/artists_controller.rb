# frozen_string_literal: true

module Api
  module Spotify
    module V1
      class ArtistsController < ApplicationController
        def show
          spotify_artists = ::Spotify::Artist.new

          render json: {
            data: {
              artist: spotify_artists.find(params[:id]),
              albums: spotify_artists.albums(params[:id])
            }
          }
        end
      end
    end
  end
end
