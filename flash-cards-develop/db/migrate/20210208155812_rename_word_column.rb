class RenameWordColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :cards, :word, :front
  end
end
