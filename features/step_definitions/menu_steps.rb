def create_menu(name)
	create_model("menu_item: \"#{name}\"")
end

def find_menu(name)
	find_model("menu_item: \"#{name}\"")
end

Given /^menu_item "([^"]+)" exists and belongs to menubar "([^"]+)"$/ do |mname1, mname2|
	menu_item = create_menu(mname1)
	menu_item.should_not be_nil
	menubar = find_model("menubar: \"#{mname2}\"")
	menubar.children << menu_item
	menubar.save!
end

When /^I visit a page with menu_item "([^"]+)"$/ do |arg1|
	menubar = find_menu(arg1)
	menubar.should_not be_nil
	visit test_horizontal_menubar_path(menubar)
end

Then /^I should see menu_item "([^"]*)"$/ do |name|
	menu_item = find_menu(name)
  pending # express the regexp above with the code you wish you had
end