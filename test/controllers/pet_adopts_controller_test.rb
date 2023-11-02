require "test_helper"

class PetAdoptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pet_adopts_index_url
    assert_response :success
  end
end
