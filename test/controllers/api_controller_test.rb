require "test_helper"

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get imdb" do
    get api_imdb_url
    assert_response :success
  end
end
