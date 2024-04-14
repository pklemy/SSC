require "test_helper"

class Employees::VendorControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employees_vendor_new_url
    assert_response :success
  end

  test "should get index" do
    get employees_vendor_index_url
    assert_response :success
  end

  test "should get show" do
    get employees_vendor_show_url
    assert_response :success
  end

  test "should get edit" do
    get employees_vendor_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get employees_vendor_destroy_url
    assert_response :success
  end
end
