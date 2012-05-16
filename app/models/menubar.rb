class Menubar < MenuItem
  attr_accessible :name
	has_many :children, class_name: 'MenuItem', foreign_key: :parent_id, autosave: true

	def to_html
		"%ul##{name}.hmenu"
	end

end
