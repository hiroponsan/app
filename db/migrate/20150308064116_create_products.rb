class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :year
      t.integer :credit
      t.string :professer
      t.text :condition
      t.text :goal
      t.text :outline
      t.text :carriculum
      t.text :evaluation
      t.text :textbook
      t.timestamps null: false
    end
  end
end
