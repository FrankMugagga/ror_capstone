require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @user = User.create(name: 'lumbuye', email: 'lumbuye@g.com', password: 123_456)
    @category = @user.categories.create(name: 'Food', icon: 'food recipe.jpg')
  end

  it 'Should be valid if all fields are filled' do
    expect(@category).to be_valid
  end

  it 'Should be invalid if any of the items is missing' do
    @category.name = ''
    @category.icon = ''
    expect(@category).not_to be_valid
    expect(@category.errors[:name]).to include("can't be blank")
    expect(@category.errors[:icon]).to include("can't be blank")
  end
end
