class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
    	t.string :title, default: "Album Sin Titulo"
    	t.belongs_to :user
    	t.timestamps
    end
  end
end
