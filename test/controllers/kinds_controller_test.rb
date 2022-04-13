require "test_helper"

class KindsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kind = Kind.create(name: "Appetizer") 
    @admin = User.create(username: "admin", email: "admin@test.com", password: "admin", admin: true )

  end

  test "should get index" do
    get kinds_url
    assert_response :success
  end

  test "should get new" do
    sign_in(@admin)
    get new_kind_url
    assert_response :success
  end

  test "should create kind" do
    sign_in(@admin) 
    assert_difference('Kind.count', 1) do
      post kinds_url, params: { kind: { name: "Soups" } }
    end

    assert_redirected_to kind_url(Kind.last)
  end

  test "should show kind" do
    get kind_url(@kind)
    assert_response :success
  end

  test "should not create kind if not admin" do 
    assert_no_difference('Kind.count',1) do 
      post kinds_url, params: { kind: { name: "Mains" } }
    end

    assert_redirected_to kinds_url 
  end

  # =begin test "should get edit" do
  #   get edit_kind_url(@kind)
  #   assert_response :success
  # end

  # test "should update kind" do
  #   patch kind_url(@kind), params: { kind: {  } }
  #   assert_redirected_to kind_url(@kind)
  # end

  # test "should destroy kind" do
  #   assert_difference('Kind.count', -1) do
  #     delete kind_url(@kind)
  #   end

  #   assert_redirected_to kinds_url
  # end =end
end
