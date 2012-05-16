require 'spec_helper'

describe MenuBarCell do
  context "cell rendering" do 
    
    context "rendering display" do
			before :each do
				@menubar = MenuItem.make! :menubar, name: 'menubar'
				@menubar.should_not be_nil
				@menubar.children.should_not be_nil
			end
				
			it "renders the menubar as a ul" do
				res = render_cell :menu_bar, :display, menu_item: @menubar
				res.should have_selector('ul', id: 'menubar', class: 'hmenu')
			end

			it "renders each child as a Li a" do
				@menubar.children << ( MenuItem.make! text: 'Home', link: '#')
				res = render_cell :menu_bar, :display, menu_item: @menubar
				res.should have_selector('ul li', id: 'home')
				res.should have_selector('ul li a', href: '#', text: 'Home')
			end
			
			it "recursively renders each child of a child as a ul" do
				@menubar.children << ( MenuItem.make! text: 'Home', link: '#')
				m2 = MenuItem.make! text: 'Products', link: '#'
				@menubar.children << m2
				m2a = MenuItem.make! text: 'Product 1', link: '/products/1'
				m2.children << m2a
				m2b = MenuItem.make! text: 'Product 2', link: '/products/2'
				m2.children << m2b
				res = render_cell :menu_bar, :display, menu_item: @menubar
				
				p = res.find('ul', id: 'products')
				p.should_not be_nil
				p.should have_selector('li', text: 'Product 1')
				p.should have_selector('li', text: 'Product 2')
			end
				

		end
	end

  context "cell instance" do 
    subject { cell(:menu_bar) } 
    
    it { should respond_to(:display) }
    
  end
end
