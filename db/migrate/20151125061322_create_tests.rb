class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :year
      t.string :semester
      t.string :textbook
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
