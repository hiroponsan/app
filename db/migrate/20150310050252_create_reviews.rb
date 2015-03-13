class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :report
      t.string :attendence
      t.string :test
      t.text :review
      t.integer :easy
      t.integer :fun
      t.timestamps null: false
    end
  end
end
