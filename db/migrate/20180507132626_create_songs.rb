class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :song_attachment
      t.string :song_title
      t.string :duration
      t.integer :music_album_id, index: true

      t.timestamps
    end
  end
end
