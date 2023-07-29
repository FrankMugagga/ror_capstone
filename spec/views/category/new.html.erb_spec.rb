require 'rails_helper'

RSpec.describe 'category/new', type: :view do
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL

  before do
    @user = User.create(name: 'lumbuye', email: 'lumbuye@g.com', password: 123_456)
    sign_in @user
  end

  describe 'Category index' do
    before do
      @category = @user.categories.create(name: 'Food', icon: 'food recipe.jpg')
    end

    it 'I can see the heading' do
      visit new_category_path
      expect(page).to have_content('NEW CATEGORY')
    end
  end
end
