class AddProductIdToTest < ActiveRecord::Migration
  def change
    add_column :tests, :product_id, :integer
  end
end
