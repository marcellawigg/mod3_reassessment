class Legislator
  attr_reader :service, :first_name, :last_name, :party, :website, :bioguide_id, :slug

  def initialize(legislator)
    @first_name = legislator[:first_name]
    @last_name = legislator[:last_name]
    @party = legislator[:party]
    @website = legislator[:website]
    @bioguide_id = legislator[:bioguide_id]
    @slug = self.slug
  end

  def self.service
    @service = SunlightService.new
  end

  def self.find_by_zip(zip)
    service.find_by_zip(zip).map { |legislator| new(legislator) }
  end

  def self.rebuild_first(slug)
    slug.split('-').first.capitalize
  end

  def self.rebuild_last(slug)
    slug.split('-').last.capitalize
  end

  def self.find_by_name(first_name, last_name)
    new(service.find_by_name(first_name, last_name).first)
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

  def full_name
    first_name + " " + last_name
  end

  def slug
    full_name.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end
end
