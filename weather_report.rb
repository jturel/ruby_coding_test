require './weather_service'

conditions_raleigh_nc = WeatherService.conditions('NC', 'Raleigh')
forecast_raleigh_nc = WeatherService.forecast_ten_days('NC', 'Raleigh')

# conditions_mumbai = WeatherService.conditions('Maharashtra', 'Mumbai')
# forecast_mumbai = WeatherService.forecast_ten_days('Maharashtra', 'Mumbai')

puts '================================'
puts 'location: ' + conditions_raleigh_nc['current_observation']['display_location']['full']
puts 'current temp: ' + conditions_raleigh_nc['current_observation']['temp_f'].to_s
puts 'wind speed: ' + conditions_raleigh_nc['current_observation']['wind_mph'].to_s
puts '================================'

forecast_raleigh_nc['forecast']['simpleforecast']['forecastday'].each do |day|
  puts "Date: #{day['date']['pretty']} High Temp: #{day['high']['fahrenheit']} Low Temp: #{day['low']['fahrenheit']}"
end
