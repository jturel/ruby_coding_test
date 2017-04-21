require './weather_service'

RSpec.describe WeatherService do
  subject { WeatherService }

  before :each do
    @mocked_response = double(HTTParty::Response, parsed_response: [])
  end

  it 'can retrieve alerts for a city and state' do
    expect(subject).to receive(:get).with('/alerts/q/NC/Raleigh.json').and_return @mocked_response
    WeatherService.alerts('NC', 'Raleigh')
  end

  it 'can retrieve current conditions for a city and state' do
    expect(subject).to receive(:get).with('/conditions/q/NC/Raleigh.json').and_return @mocked_response
    WeatherService.conditions('NC', 'Raleigh')
  end

  it 'can retrieve a ten day forecast for a city and state' do
    expect(subject).to receive(:get).with('/alerts/q/NC/Raleigh.json').and_return @mocked_response
    WeatherService.ten_day_forecast('NC', 'Raleigh')
  end
end
