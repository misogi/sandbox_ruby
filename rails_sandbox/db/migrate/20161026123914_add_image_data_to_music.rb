class AddImageDataToMusic < ActiveRecord::Migration[5.0]
  def change
    add_column :musics, :image_data, :text
  end
end
