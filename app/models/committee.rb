class Committee
  attr_reader :name, :chamber, :subcommittee
  def self.service
    @service = SunlightService.new
  end


  def self.find_committees(bioguide_id)
      service.find_committees(bioguide_id).map { |committee| Committee.new(committee) }
  end

  def initialize(committee)
    @name = committee[:name]
    @chamber = committee[:chamber]
    @subcommittee = committee[:subcommittee]
  end

end
