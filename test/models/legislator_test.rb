require './test/test_helper'

class LegislatorTest < ActiveSupport::TestCase
  test "#find_by_zip" do
    VCR.use_cassette("#find_by_zip") do
      legislators = Legislator.find_by_zip('80203')
      legislator = legislators.first
      assert_equal 3, legislators.count
      assert_equal "Cory", legislator.first_name
      assert_equal "Gardner", legislator.last_name
      assert_equal "R", legislator.party
      assert_equal "http://www.gardner.senate.gov", legislator.website
    end
  end

end
