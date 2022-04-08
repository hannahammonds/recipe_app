require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do 
    @admin = User.create(username: "admin1", email: "admin1@test.com", password: "admin", admin: true) 
    
  end

  test "get new category form and create category" do 
    sign_in(@admin)
    get "/categories/new"
    assert_response :success 
    assert_difference "Category.count", 1 do
      post categories_path, params: { category: {name: "Spring" } }
      assert_response :redirect 
    end
    follow_redirect!
    assert_response :success
    assert_match "Spring", response.body 
  end

end
