class RemoveAllFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :all, :integer
  end
end
