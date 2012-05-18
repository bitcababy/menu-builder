class TestController < ApplicationController
	def menubar
		@menubar = Menubar.first
	end
	
end
