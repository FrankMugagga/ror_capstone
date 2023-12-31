class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_and_belongs_to_many :expenses, join_table: 'expense_categories', dependent: :destroy
  validates :name, :icon, presence: true
end
