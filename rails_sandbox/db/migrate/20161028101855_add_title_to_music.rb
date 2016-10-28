class AddTitleToMusic < ActiveRecord::Migration[5.0]
  def change
    add_column :musics, :title, :string
  end
end
