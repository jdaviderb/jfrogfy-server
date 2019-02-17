# frozen_string_literal: true

module Youtube
  class Agent
    def get(url, params = {})
      agent.get("https://m.youtube.com") if agent.cookies.blank?

      agent.get(url, params)
    end

    def cookies
      agent.cookies
    end

    private
      def agent
        @agent ||= Mechanize.new

        @agent.user_agent = user_agent

        @agent
      end

      def user_agent
        @user_agent ||= "Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)"
      end
  end
end
