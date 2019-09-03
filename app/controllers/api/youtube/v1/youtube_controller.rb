# frozen_string_literal: true

module Api
  module Youtube
    module V1
      class YoutubeController < ApplicationController
        def get_video
          artist = params[:artist]
          song = params[:song]

          return render json: {}, status: 422 if artist.blank? || song.blank?

          search = "#{song} #{artist}"

          result = ::YoutubeAudio::Search.new(search).results.first.formats.first


          render json: {
            id: result.url,
            video: result.url
          }
        end
      end
    end
  end
end
