class CreateCheeses < ActiveRecord::Migration
  def change
    create_table :cheeses do |t|
      t.string :name
      t.text :thoughts
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
