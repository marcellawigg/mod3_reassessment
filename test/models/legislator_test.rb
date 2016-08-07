require './test/test_helper'

class LegislatorTest < ActiveSupport::TestCase
  attr_reader :legislators, :legislator
  def setup
    @legislators = Legislator.find_by_zip('80203')
    @legislator = legislators.first
  end
  test "#find_by_zip" do
    VCR.use_cassette("#find_by_zip") do
      assert_equal 3, legislators.count
      assert_equal "Cory", legislator.first_name
      assert_equal "Gardner", legislator.last_name
      assert_equal "R", legislator.party
      assert_equal "http://www.gardner.senate.gov", legislator.website
    end
  end

  test "#full_party_name" do
      assert_equal "R", legislator.party
      assert_equal "Republican", legislator.full_party
      second_legislator = Legislator.find_by_zip('80203').last
      assert_equal "D", second_legislator.party
      assert_equal "Democrat", second_legislator.full_party
  end

  test "#full_name" do
    assert_equal "Cory Gardner", legislator.full_name
  end

  test "#slug" do
    assert_equal "cory-gardner", legislator.slug
  end
end
