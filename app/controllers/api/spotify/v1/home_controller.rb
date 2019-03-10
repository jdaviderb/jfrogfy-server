  # frozen_string_literal: true

  module Api
    module Spotify
      module V1
        class HomeController < ApplicationController
          def index
            spotify_home = ::Spotify::Home.new

            render json: { data: spotify_home.home }
          end
        end
      end
    end
  end
