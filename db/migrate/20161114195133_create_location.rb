class CreateLocation < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
    	t.belongs_to :photo
    	t.belongs_to :page
    	t.integer :page_place, null: false
    	t.timestamps
    end
  end
end
