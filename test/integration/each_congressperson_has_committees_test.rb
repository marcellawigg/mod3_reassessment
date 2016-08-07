require './test/test_helper'

class EachCongresspersonHasCommitteesTest < Capybara::Rails::TestCase

  def test_each_congressperson_has_committees_accessible
    visit '/'
    fill_in 'Search by Zip', with: '80203'
    click_button "Search"
    page.current_path.must_equal search_path
    click_on "Committees"
    page.current_path.must_equal "/legislators/cory-gardner/committees"
    assert page.has_content?("Cory Gardner's Committees")
  end
end
