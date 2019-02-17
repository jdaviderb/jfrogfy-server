# frozen_string_literal: true

module Youtube
  class Search
    attr_reader :result

    def initialize
      @result = []
    end

    def search(keyword)
      result.clear

      agent.get("https://m.youtube.com/results", q: keyword)
           .search('div[dir="ltr"] a')
           .each do |element|
             result.push(
               id: CGI.parse(element["href"].strip.chop)["/watch?v"][0],
               name: element.text.chop,
               href: element["href"].chop
              )
           end

      result
    end

    def agent
      @agent ||= Youtube::Agent.new
    end
  end
end
