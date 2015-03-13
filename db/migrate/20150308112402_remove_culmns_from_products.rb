class RemoveCulmnsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :credit, :integer
    remove_column :products, :condition, :text
    remove_column :products, :goal, :text
    remove_column :products, :outline, :text
    remove_column :products, :carriculum, :text
    remove_column :products, :evaluation, :text
    remove_column :products, :textbook, :text
  end
end
