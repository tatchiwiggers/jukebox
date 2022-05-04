class AddCategoryToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :category, :string
  end
end
