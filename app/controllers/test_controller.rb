class TestController < ApplicationController
  def dropdown1
  end

  def dropdown2
  end

  def vertical
  end

	def menubar
		@menubar = Menubar.first
	end

end
