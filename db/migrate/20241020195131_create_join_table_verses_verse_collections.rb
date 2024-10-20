class CreateJoinTableVersesVerseCollections < ActiveRecord::Migration[7.1]
  def change
    create_join_table :bible_verses, :verse_collections do |t|
      # t.index [:bible_verse_id, :verse_collection_id]
      # t.index [:verse_collection_id, :bible_verse_id]
    end
  end
end
