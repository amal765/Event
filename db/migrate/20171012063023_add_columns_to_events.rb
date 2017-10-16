class AddColumnsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :address, :string
    add_column :events, :name, :string
    add_column :events, :from, :date
    add_column :events, :to, :date
  end
end
