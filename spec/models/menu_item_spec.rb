require 'spec_helper'

describe Menu do
	
	describe 'instance methods' do
		before :each do
			@root = MenuItem.make!
		end
		
		describe '#root?' do
			it "returns true if the node has no parent" do
				@root.root?.should be_true
			end
			it "returns false if the node has a parent" do
				m2 = MenuItem.make! parent: @root
				m2.root?.should be_false
			end
		end #root?
		
		describe '#enabled?' do
			it "returns true if the menu_item is enabled" do
				@root.enabled = true
				@root.enabled?.should be_true
			end
			it "returns false if the menu_item is not enabled" do
				@root.enabled = false
				@root.enabled?.should be_false
			end
		end
		
	end # instance methods

end
