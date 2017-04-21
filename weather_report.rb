require './weather_service'
class WeatherReport
  def initialize(conditions, forecast)
    @conditions = conditions
    @forecast = forecast
  end

  def location
    @conditions['current_observation']['display_location']['full'].to_s
  end

  def temp
    @conditions['current_observation']['temp_f'].to_s
  end

  def speed
    @conditions['current_observation']['wind_mph'].to_s
  end

  def the_forecast_thing
    response_array = []
     @forecast['forecast']['simpleforecast']['forecastday'].each do |day|
      response_array << "Date: #{day['date']['pretty']} High Temp (F): #{day['high']['fahrenheit']} Low Temp (F): #{day['low']['fahrenheit']}"
    end
    response_array
  end
end

conditions_raleigh_nc = WeatherService.conditions('NC', 'Raleigh')
forecast_raleigh_nc = WeatherService.forecast_ten_days('NC', 'Raleigh')

conditions_mumbai = WeatherService.conditions('Maharashtra', 'Mumbai')
forecast_mumbai = WeatherService.forecast_ten_days('Maharashtra', 'Mumbai')

raleigh_report = WeatherReport.new(conditions_raleigh_nc, forecast_raleigh_nc)
mumbai_report = WeatherReport.new(conditions_mumbai, forecast_mumbai)

puts '================================'
puts 'location: ' + raleigh_report.location
puts 'current temp (F): ' + raleigh_report.temp
puts 'wind speed (mph): ' + raleigh_report.speed
puts ''
puts '*********10 Day Forecast********'
raleigh_report.the_forecast_thing.each do |forecast_day|
  puts forecast_day
end
puts ''
puts '================================'
puts 'location: ' + mumbai_report.location
puts 'current temp (F): ' + mumbai_report.temp
puts 'wind speed (mph): ' + mumbai_report.speed
puts ''
puts '*********10 Day Forecast********'
mumbai_report.the_forecast_thing.each do |forecast_day|
  puts forecast_day
end

#
# puts ''
# puts ''
# puts '================================'
# puts 'Weather for: ' + conditions_mumbai['current_observation']['display_location']['full']
# puts '================================'
#
# puts '================================'
# puts 'location: ' + conditions_mumbai['current_observation']['display_location']['full']
# puts 'current temp: ' + conditions_mumbai['current_observation']['temp_f'].to_s
# puts 'wind speed: ' + conditions_mumbai['current_observation']['wind_mph'].to_s
# puts '================================'
#
# forecast_mumbai['forecast']['simpleforecast']['forecastday'].each do |day|
#   puts "Date: #{day['date']['pretty']} High Temp: #{day['high']['fahrenheit']} Low Temp: #{day['low']['fahrenheit']}"
# end
