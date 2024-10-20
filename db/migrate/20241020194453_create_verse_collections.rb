class CreateVerseCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :verse_collections do |t|
      t.string :comment

      t.timestamps
    end
  end
end
