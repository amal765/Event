class AddMobileAndStartToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :mobile, :string
    add_column :events, :start, :time
  end
end
