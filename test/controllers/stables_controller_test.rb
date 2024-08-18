require "test_helper"

class StablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stables_index_url
    assert_response :success
  end

  test "should get show" do
    get stables_show_url
    assert_response :success
  end

  test "should get new" do
    get stables_new_url
    assert_response :success
  end

  test "should get edit" do
    get stables_edit_url
    assert_response :success
  end
end
