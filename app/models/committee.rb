class Committee
  attr_reader :name, :chamber, :subcommittee
  def self.service
    @service = SunlightService.new
  end

  def self.find_committees(bioguide_id)
      service.find_committees(bioguide_id).map { |committee| Committee.new(committee) }
  end

  def self.parent_committee
    if subcommittee == true
      service.parent_committee()
  end

  def initialize(committee)
    @name = committee[:name]
    @chamber = committee[:chamber]
    @subcommittee = committee[:subcommittee]
    @parent_committee_id = 
  end

end
