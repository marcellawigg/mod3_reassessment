class Committee

  attr_reader :name, :chamber, :subcommittee, :parent_committee_id
  def self.service
    @service = SunlightService.new
  end

  def self.find_committees(bioguide_id)
      service.find_committees(bioguide_id).map { |committee| Committee.new(committee) }
  end

  def self.parent_committee(parent_committee_id)
      service.parent_committee(parent_committee_id).first[:name]
  end

  def initialize(committee)
    @name = committee[:name]
    @chamber = committee[:chamber]
    @subcommittee = committee[:subcommittee]
    @parent_committee_id = committee[:parent_committee_id]
  end

end
