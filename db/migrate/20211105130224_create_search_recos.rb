class CreateSearchRecos < ActiveRecord::Migration[6.0]
  def change
    create_table :search_recos do |t|
      t.integer :energy, default: 0
      t.integer :valence, default: 0
      t.integer :popularity, default: 0
      t.text :genres, array: true, default: []
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
