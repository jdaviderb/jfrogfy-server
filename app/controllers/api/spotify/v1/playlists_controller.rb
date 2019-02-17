# frozen_string_literal: true

module Api
  module Spotify
    module V1
      class PlaylistsController < ApplicationController
        def show
          spotify_playlists = ::Spotify::Playlist.new

          render json: { data: spotify_playlists.find(params[:id]) }
        end
      end
    end
  end
end
