# frozen_string_literal: true

module Youtube
  class Video
    def get_video(youtube_id)
      result = agent.get("https://m.youtube.com/watch", v: youtube_id)

      # set video hq
      hq = result.search('input[value="HQ"]')

      if hq.present?
        result = result.forms[1].submit
      end

      result.search('a[alt="video"]')[0]&.attributes["href"].value
    end

    def agent
      @agent ||= Youtube::Agent.new
    end
  end
end
