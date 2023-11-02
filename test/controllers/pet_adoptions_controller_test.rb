require "test_helper"

class PetAdoptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pet_adoptions_new_url
    assert_response :success
  end

  test "should get create" do
    get pet_adoptions_create_url
    assert_response :success
  end
end
