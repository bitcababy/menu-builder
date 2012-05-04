class MenuBarCell < Cell::Rails

  def display(options={})
		@menubar = options[:menu]
		@menubar ||= Menubar.find :first
    render
  end

		
end
