def create_menu(name)
	create_model("menu: \"#{name}\"")
end

def find_menu(name)
	find_model("menu: \"#{name}\"")
end

Given /^menu "([^"]+)" exists and belongs to menubar "([^"]+)"$/ do |mname1, mname2|
	menu = create_menu(mname1)
	menu.should_not be_nil
	menubar = find_model("menubar: \"#{mname2}\"")
	menubar.children << menu
	menubar.save!
end

When /^I visit a page with menu "([^"]+)"$/ do |arg1|
	menubar = find_menu(arg1)
	menubar.should_not be_nil
	visit test_horizontal_menubar_path(menubar)
end

Then /^I should see menu "([^"]*)"$/ do |name|
	menu = find_menu(name)
  pending # express the regexp above with the code you wish you had
end