require 'rails_helper'

RSpec.describe "homes/splash", type: :view do
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL

    it 'I can see the heading' do
      visit '/'
      expect(page).to have_content('Easy Finance')
    end
end