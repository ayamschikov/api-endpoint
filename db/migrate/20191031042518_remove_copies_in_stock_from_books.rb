class RemoveCopiesInStockFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :copies_in_stock, :integer
  end
end
