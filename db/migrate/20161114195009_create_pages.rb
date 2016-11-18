class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
    	t.integer :layout
    	t.integer :page_num, null: false
    	t.belongs_to :album
    	t.timestamps
    end
  end
end
