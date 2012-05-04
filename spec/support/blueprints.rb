require 'machinist/active_record'

Menu.blueprint do
	parent			{ nil }
	text				{ "Item_#{sn}" }
	enabled			{ true }
	link				{ '#' }
	children(0)
end

Menu.blueprint(:menubar) do
end
	