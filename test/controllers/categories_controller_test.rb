require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get categories_index_url
    assert_response :success
  end

  test 'should get newshow' do
    get categories_newshow_url
    assert_response :success
  end

  test 'should get create' do
    get categories_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get categories_destroy_url
    assert_response :success
  end
end
