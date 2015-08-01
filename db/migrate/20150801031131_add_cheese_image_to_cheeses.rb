class AddCheeseImageToCheeses < ActiveRecord::Migration
  def change
    add_column :cheeses, :cheese_image_id, :string
  end
end
