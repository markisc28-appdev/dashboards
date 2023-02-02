require("open-uri")
require("json")

exra_url = "https://api.exchangerate.host/symbols"

#Reading JSON file
raw_data = URI.open(exra_url).read
parsed_data = JSON.parse(raw_data)

rates_hash = parsed_data.fetch("symbols")

code_array = Array.new

rates_hash.each do |code, description|
  code_array.push(code)
end
