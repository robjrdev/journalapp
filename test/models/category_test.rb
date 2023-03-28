require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without title" do
    category = Category.new
    assert_not category.save, "Saved the category without a title"
  end
  
  test "should not save category with title length less than 5" do
    category = Category.new(title: "test")
    assert_not category.save, "Saved the category with title length less than 5"
  end
  
  test "should save category with valid inputs" do
    user = User.create(email: "test@example.com", password: "password")
    category = Category.new(title: "Test Category", user: user)
    assert category.save, "Failed to save category with valid inputs"
  end
end