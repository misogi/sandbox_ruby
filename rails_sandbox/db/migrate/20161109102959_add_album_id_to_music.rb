class AddAlbumIdToMusic < ActiveRecord::Migration[5.0]
  def change
    add_column :musics, :album_id, :integer, 
               null: :false, foreign_key: true,
               index: true
  end
end
