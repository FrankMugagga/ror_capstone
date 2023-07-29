require 'rails_helper'

RSpec.describe Expense, type: :model do

  before do
    @user = User.create(name:'lumbuye', email:'lumbuye@g.com', password:123456)
    @category = @user.categories.create(name: 'Food', icon: 'food recipe.jpg')  
    @expense = @category.expenses.create(name: 'food expense', amount: 1200, author_id:@user.id)
    
  end

  it 'Should be valid if all forms are filled' do
    expect(@expense).to be_valid
  end

  it 'Should be invalid if any of the fileds is missing' do
    @expense.name = ''
    @expense.amount = ''
    @expense.author_id = ''
    expect(@expense).not_to be_valid
    expect(@expense.errors[:name]).to include("can't be blank")
    expect(@expense.errors[:amount]).to include("can't be blank")
  end

  it 'Should be invalid if the amount is not a number or less than one' do
    @expense.amount = -1
    expect(@expense).not_to be_valid
    @expense.amount = 'u'
    expect(@expense).not_to be_valid
  end
end