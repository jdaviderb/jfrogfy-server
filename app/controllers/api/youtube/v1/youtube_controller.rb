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

          youtube_search_result = ::Youtube::Search.new.search(search)[0][:id]

          render json: {
            id: youtube_search_result,
            video: ::Youtube::Video.new.get_video(youtube_search_result)
          }
        end
      end
    end
  end
end
