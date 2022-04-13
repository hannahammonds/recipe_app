require "test_helper"

class ListKindsTest < ActionDispatch::IntegrationTest
  
  def setup
    @kind1 = Kind.create(name: "Appetizer")
    @kind2 = Kind.create(name: "Soups")
  end

  test "should show kind list" do 
    get 'categories' 
    assert_select "a[href=?]", kind_path(@kind1), text:@kind1.name
    assert_select "a[href=?]", kind_path(@kind2), text:@kind2.name
  end
end
