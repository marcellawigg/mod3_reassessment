require './test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  attr_reader :service
  def setup
    @service ||= SunlightService.new
  end

  test "#find_by_zip" do
    VCR.use_cassette("#find_by_zip") do
      legislators = service.find_by_zip('80203')
      legislator = legislators.first
      assert_equal 3, legislators.count
      assert_equal "Cory", legislator[:first_name]
      assert_equal "Gardner", legislator[:last_name]
      assert_equal "R", legislator[:party]
      assert_equal "http://www.gardner.senate.gov", legislator[:website]
    end
  end

  test "#find_committees" do
    VCR.use_cassette("#find_committees") do
      committees = service.find_committees('G000562')
      committee = committees.first
      assert_equal 15, committees.count
      assert_equal "Multilateral International Development, Multilateral Institutions, and International Economic, Energy, and Environmental Policy", committee[:name]
      assert_equal "senate", committee[:chamber]
      assert_equal true, committee[:subcommittee]
    end
  end
end
