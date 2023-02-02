class ExraController < ApplicationController

  def home
    render({:template => "exra_templates/dashboard_home.html.erb"})
  end

  def get_rates

    exra_url = "https://api.exchangerate.host/symbols"

    #Reading JSON file
    raw_data = URI.open(exra_url).read
    parsed_data = JSON.parse(raw_data)

    rates_hash = parsed_data.fetch("symbols")

    @code_array = Array.new

    rates_hash.each do |code, description|
      @code_array.push(code)
    end


    render({:template => "exra_templates/exra_home.html.erb"})
  end

  def exchange_rates
    @first = params.fetch("firstrate")

    exra_url = "https://api.exchangerate.host/symbols"

    #Reading JSON file
    raw_data = URI.open(exra_url).read
    parsed_data = JSON.parse(raw_data)

    rates_hash = parsed_data.fetch("symbols")

    @code_array = Array.new

    rates_hash.each do |code, description|
      @code_array.push(code)
    end


    render({:template => "exra_templates/exra_first.html.erb"})
  end

end
