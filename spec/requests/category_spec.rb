require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'lumbuye', email: 'lumbuye@g.com', password: 123_456)
    sign_in @user
  end

  describe 'GET /index' do
    before do
      get '/categories'
    end

    it 'Should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'Should return correct template' do
      expect(response).to render_template(:index)
    end

    it 'Should return place holder from the body' do
      expect(response.body).to include('CATEGORIES')
    end
  end

  describe 'GET /show' do
    before do
      @category = @user.categories.create(name: 'Food', icon: 'food recipe.jpg')
      get "/categories/#{@category.id}"
    end

    it 'Should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'Should return correct template' do
      expect(response).to render_template(:show)
    end

    it 'Should return place holder from the body' do
      expect(response.body).to include(@category.name)
    end
  end

  describe 'POST /new' do
    before do
      @category = @user.categories.create(name: 'Food', icon: 'food recipe.jpg')
      get '/categories/new'
    end

    it 'Should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'Should return correct template' do
      expect(response).to render_template(:new)
    end

    it 'Should return place holder from the body' do
      expect(response.body).to include('NEW CATEGORY')
    end
  end
end
