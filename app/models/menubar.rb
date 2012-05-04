class Menubar < Menu
  attr_accessible :name
	has_many :children, class_name: 'Menu', foreign_key: :parent_id

	def to_html
		"%ul##{name}.hmenu"
	end

end
