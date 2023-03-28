require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @category = categories(:one)
    sign_in @user
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should show category" do
    task = tasks(:one)
    get category_task_path(@category, task)
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_path, params: { category: { title: "New Category" } }
    end

    assert_redirected_to categories_path
  end

  test "should get edit" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_path(@category), params: { category: { title: "Updated Category" } }
    assert_redirected_to categories_path
    @category.reload
    assert_equal "Updated Category", @category.title
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_path(@category)
    end

    assert_redirected_to categories_path
  end
end
