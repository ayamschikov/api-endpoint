class CreateJoinTableShopsBooks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :shops, :books do |t|
      t.index [:shop_id, :book_id]
      t.index [:book_id, :shop_id]
      t.integer :copies_in_stock
    end
  end
end
