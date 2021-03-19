class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.integer :collection_id
      t.integer :spent_time
      t.integer :skipped_cards, array: true, default: []
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
