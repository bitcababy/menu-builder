class MenuItem < ActiveRecord::Base
  attr_accessible :enabled, :parent_id, :text

	belongs_to :parent, class_name: 'MenuItem'
	has_many :children, class_name: 'MenuItem', foreign_key: 'parent_id', inverse_of: :parent, autosave: true

	def root?
		parent.nil?
	end
	
	def to_html
		"li"
	end
	

end
