class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
  		t.string :photo#, null: false
  		t.belongs_to :user
  		t.timestamps
  	end
  end
end