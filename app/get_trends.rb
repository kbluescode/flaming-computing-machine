require 'open-uri'
require 'json'

class GetTrends

  url = 'http://hawttrends.appspot.com/api/terms/'
  buffer = open(url).read

  data = JSON.parse(buffer)

  # 13 Canada
  # 1 USA

  puts data["13"] 
  puts data["1"]

end

GetTrends