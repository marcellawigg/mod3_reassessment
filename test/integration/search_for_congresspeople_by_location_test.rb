require './test/test_helper'

class SearchForCongresspeopleByLocationTest < Capybara::Rails::TestCase

  def test_it_reaches_the_root_page
    visit '/'
    assert_equal 200, page.status_code
    assert page.has_content?('Search')
    fill_in 'Search by Zip', with: '80203'
    click_button "Search"
    page.current_path.must_equal search_path
    assert page.has_content?('Cory Gardner (Republican)')
    assert page.has_content?('Diana DeGette (Democrat)')
    assert page.has_content?('Michael Bennet (Democrat)')
  end
end
