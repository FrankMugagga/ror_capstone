require 'rails_helper'

RSpec.describe User, type: :model do

  it 'Should be valid with a name' do
    user = User.new(name:'lumbuye', email:'lumbuye@g.com', password:123456)
    expect(user).to be_valid
  end

  it 'Should be invalid if a field is missing' do
    user = User.new(name:'', email:'', password:'')
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
    expect(user.errors[:email]).to include("can't be blank")
    expect(user.errors[:password]).to include("can't be blank")
  end

end
