require 'rails_helper'

RSpec.describe "category/index", type: :view do
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL

  before do
    @user = User.create(name: 'lumbuye', email: 'lumbuye@g.com', password: 123456)
    sign_in @user
  end

  describe 'Category show' do
    before do
      @category = @user.categories.create(name: 'Food', icon: 'food recipe.jpg')
    end

    it 'I can see the heading' do
      visit categories_path(@category)
      expect(page).to have_content('CATEGORIES')
    end
  end
end