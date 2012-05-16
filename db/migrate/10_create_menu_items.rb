class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
			t.string		:type
      t.integer 	:parent_id
      t.string 		:text
      t.boolean 	:enabled
			t.boolean		:visible
			t.string		:link

			t.string		:name
      t.timestamps
    end

		add_index :menus, :type
		add_index :menus, :parent_id
  end
end
