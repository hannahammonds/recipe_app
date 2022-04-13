require "test_helper"

class CreateKindTest < ActionDispatch::IntegrationTest
  setup do 
    @admin = User.create(username: "admin1", email: "admin1@test.com", password: "admin", admin: true) 
  end 
  
  test "get new test form and create kind" do 
    get "/kinds/new"
    assert_response :success
    assert_difference "Kind.cout", 1 do 
      post kinds_path, params: { category: { name: "Appetizers" } }
      assert_response :redirect 
    end
    follow_redirect!
    assert_response :success
    assert_match "Appetizers", response.body 
  end

end
