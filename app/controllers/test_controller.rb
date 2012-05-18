class TestController < ApplicationController
  def vertical
  end

	def menubar
		@menubar = Menubar.first
	end

end
