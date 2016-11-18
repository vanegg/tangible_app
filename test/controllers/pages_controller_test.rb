require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get newpage" do
    get pages_newpage_url
    assert_response :success
  end

end
