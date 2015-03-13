class AddAllToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :all, :integer
  end
end
