class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
			t.string		:type
      t.integer 	:parent_id
      t.string 		:text
      t.boolean 	:enabled
			t.boolean		:visible
			t.string		:link

			t.string		:name
      t.timestamps
    end

		add_index :menu_items, :type
		add_index :menu_items, :parent_id
		add_index :menu_items, :visible
  end
end
