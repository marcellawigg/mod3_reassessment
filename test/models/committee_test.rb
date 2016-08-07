require './test/test_helper'

class CommitteeTest < ActiveSupport::TestCase
  test "#find_committees" do
    VCR.use_cassette("#find_committees") do
      bioguide_id = "G000562"
      committees = Committee.find_committees(bioguide_id)
      committee = committees.first
      assert_equal 15, committees.count
      assert_equal "Multilateral International Development, Multilateral Institutions, and International Economic, Energy, and Environmental Policy", committee.name
      assert_equal "senate", committee.chamber
      assert_equal true, committee.subcommittee
    end
  end

  test "#parent_committee" do
    VCR.use_cassette("#parent_committee") do
      committee_id = "SSGA"
      parent_committee = Committee.parent_committee(committee_id)
      assert_equal "Senate Committee on Homeland Security and Governmental Affairs", parent_committee
    end
  end
end
