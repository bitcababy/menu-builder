class Menu < ActiveRecord::Base
  attr_accessible :enabled, :parent_id, :text

	belongs_to :parent, class_name: 'Menu'
	has_many :children, class_name: 'Menu', foreign_key: 'parent_id', inverse_of: :parent

	def root?
		parent.nil?
	end
	
	def to_html
		"li"
	end
	

end
