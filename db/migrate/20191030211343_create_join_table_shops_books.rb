class CreateJoinTableShopsBooks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :shops, :books do |t|
      t.integer :copies_in_stock
    end
  end
end
