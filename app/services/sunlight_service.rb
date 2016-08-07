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

  def find_committees(bioguide_id)
    response = connection.get("/committees?member_ids=#{bioguide_id}")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def parent_committee(id)
    response = connection.get("committees?committee_id=#{id}")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def find_by_name(first_name, last_name)
    response = connection.get("/legislators?first_name=#{first_name}&last_name=#{last_name}")
  JSON.parse(response.body, symbolize_names: true)[:results].first
  end
end
