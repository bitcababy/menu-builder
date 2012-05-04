Feature: Menubar
  I want to see a menubar on every page

	Scenario: Normal menubar
		Given menubar "m" exists
	  And menu "menu1" exists and belongs to menubar "m"
	  When I visit a page with menu "menubar"
		Then I should see menu "menu1"

