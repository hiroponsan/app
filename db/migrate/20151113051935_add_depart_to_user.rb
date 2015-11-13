class AddDepartToUser < ActiveRecord::Migration
  def change
    add_column :users, :depart, :string
  end
end
