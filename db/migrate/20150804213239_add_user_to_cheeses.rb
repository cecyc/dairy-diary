class AddUserToCheeses < ActiveRecord::Migration
  def change
    add_column :cheeses, :user_id, :integer
  end
end
