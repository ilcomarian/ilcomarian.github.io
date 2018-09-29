class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :url
      t.string :url_show
      t.integer :user_id

      t.timestamps
    end
  end
end
