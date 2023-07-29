require 'rails_helper'

RSpec.describe 'Expense', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'lumbuye', email: 'lumbuye@g.com', password: '123456')
    sign_in @user
  end

  describe 'Get /new' do
    before do
      @category = @user.categories.create(name: 'Food', icon: 'food recipe.jpg')

      get new_category_expense_path(@category)
    end

    it 'Should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'Should return correct template' do
      expect(response).to render_template(:new)
    end

    it 'Should return place holder from the body' do
      expect(response.body).to include('NEW TRANSACTION')
    end
  end
end
