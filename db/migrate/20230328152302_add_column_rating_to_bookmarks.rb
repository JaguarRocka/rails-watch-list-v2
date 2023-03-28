class AddColumnRatingToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :rating, :integer
  end
end
