class CreateMusicAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :music_albums do |t|
      t.string :name
      t.string :photo
      t.string :genres
      t.string :artist
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
