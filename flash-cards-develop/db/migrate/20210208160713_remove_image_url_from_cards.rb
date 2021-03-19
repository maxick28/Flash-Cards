class RemoveImageUrlFromCards < ActiveRecord::Migration[6.1]
  def change
    remove_column :cards, :image_url, :string
  end
end
