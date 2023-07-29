require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get expenses_new_url
    assert_response :success
  end

  test 'should get create' do
    get expenses_create_url
    assert_response :success
  end

  test 'should get destroyclear' do
    get expenses_destroyclear_url
    assert_response :success
  end
end
