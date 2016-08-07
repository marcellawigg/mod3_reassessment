class SunlightService
  attr_reader :connection
  def initialize
    @connection = Faraday.new("http://congress.api.sunlightfoundation.com")
    connection.params[:apikey] = ENV['SUNLIGHT_API_KEY']
  end

  def find_by_zip(zip)
    response = connection.get("/legislators/locate?zip=#{zip}")
    JSON.parse(response.body, symbolize_names: true)[:results]

    end
end