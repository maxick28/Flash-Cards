class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :word, null: false
      t.string :ukrainian_translation, null: false
      t.string :image_url
      t.string :category

      t.timestamps
    end
  end
end
