class AddPublisherColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    # rubocop:disable Rails/NotNullColumn
    add_reference :books, :publisher, null: false, foreign_key: true
    # rubocop:enable Rails/NotNullColumn
  end
end
