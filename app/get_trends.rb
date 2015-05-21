require 'open-uri'
require 'json'
require_relative 'models/suggestion'

class GetTrends
 
  def self.get_trends
  url = 'http://hawttrends.appspot.com/api/terms/'
  buffer = open(url).read

  data = JSON.parse(buffer)

  data["13"].each do |keyword| # 13 Canada
    Suggestion.create(
      noun: keyword.titleize
    )
    end
  end
end


