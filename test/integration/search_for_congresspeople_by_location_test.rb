require './test/test_helper'

class SearchForCongresspeopleByLocationTest < Capybara::Rails::TestCase

  def test_it_reaches_the_root_page
    visit '/'
    assert_equal 200, page.status_code
    assert page.has_content?('Search')
  end

end
