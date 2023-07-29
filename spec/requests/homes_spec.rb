require 'rails_helper'

RSpec.describe 'Expense', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /splash' do
    before do
      get '/'
    end

    it 'Should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'Should return correct template' do
      expect(response).to render_template(:splash)
    end

    it 'Should return place holder from the body' do
      expect(response.body).to include('nance')
    end
  end
end
