Feature: Menubar
  I want to see a menubar on every page

	Scenario: Normal menubar
		Given menubar "m" exists
	  And menu_item "menu1" exists and belongs to menubar "m"
	  When I visit a page with menu_item "menubar"
		Then I should see menu_item "menu1"

