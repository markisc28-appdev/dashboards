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

first = "USD"
second = "EUR"
rate_url = "https://api.exchangerate.host/convert?from=#{first}&to=#{second}"

rate_data = URI.open(rate_url).read
parsed_rates = JSON.parse(rate_data)

get_rate = parsed_rates.fetch("result")
p get_rate
