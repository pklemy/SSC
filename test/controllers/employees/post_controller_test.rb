require "test_helper"

class Employees::PostControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employees_post_new_url
    assert_response :success
  end

  test "should get index" do
    get employees_post_index_url
    assert_response :success
  end

  test "should get show" do
    get employees_post_show_url
    assert_response :success
  end

  test "should get edit" do
    get employees_post_edit_url
    assert_response :success
  end
end
