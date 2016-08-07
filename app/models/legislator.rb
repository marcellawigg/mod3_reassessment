class Legislator
  attr_reader :service, :first_name, :last_name, :party, :website, :bioguide_id
  def self.service
    @service = SunlightService.new
  end

  def self.find_by_zip(zip)
    service.find_by_zip(zip).map { |legislator| Legislator.new(legislator) }
  end

  def initialize(legislator)
    @first_name = legislator[:first_name]
    @last_name = legislator[:last_name]
    @party = legislator[:party]
    @website = legislator[:website]
    @bioguide_id = legislator[:bioguide_id]
  end

  def full_party
    if party == "R"
      "Republican"
    elsif party == "D"
      "Democrat"
    elsif party == "I"
      "Independent"
    else
      "Other"
    end
  end

  def make_slug
    self.slug = (first_name + " " + last_name).downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end
end
