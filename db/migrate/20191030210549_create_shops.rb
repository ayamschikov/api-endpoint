class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.integer :books_sold_count
      t.string :name

      t.timestamps
    end
  end
end
