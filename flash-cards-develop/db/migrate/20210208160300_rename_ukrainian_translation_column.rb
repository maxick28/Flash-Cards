class RenameUkrainianTranslationColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :cards, :ukrainian_translation, :back
  end
end
