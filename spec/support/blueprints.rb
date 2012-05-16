require 'machinist/active_record'

MenuItem.blueprint do
	parent			{ nil }
	text				{ "Item_#{sn}" }
	enabled			{ true }
	link				{ '#' }
	children(0)
end

MenuItem.blueprint(:menubar) do
end
	