
class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount
      t.integer :author_id

      t.timestamps
    end

    add_foreign_key :expenses, :users, column: :author_id
    add_index :expenses, :author_id
  end
end



