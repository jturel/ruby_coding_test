require 'httparty'

class WeatherService
  include HTTParty

  base_uri "http://api.wunderground.com/api/#{ENV['WUNDERGROUND_API_KEY']}"

  def self.forecast_ten_days(state, city)
    get("/forecast10day/q/#{state}/#{city}.json").parsed_response
  end

  def self.conditions(state, city)
    get("/conditions/q/#{state}/#{city}.json").parsed_response
  end

  def self.alerts(state, city)
    get("/alerts/q/#{state}/#{city}.json").parsed_response
  end
end
