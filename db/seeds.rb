# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MenuItem.delete_all

menubar = Menubar.create!

menubar.children << (MenuItem.create! text: 'Home')
menubar.children << (mp = MenuItem.create! text: 'Products')

mp.children << (MenuItem.create! text: 'Product 1')
mp.children << (MenuItem.create! text: 'Product 2')

menubar.children << (mp = MenuItem.create! text: 'Cities')
mp.children << (m1 = MenuItem.create! text: 'New York')
m1.children << (MenuItem.create! text: 'Albany')
m1.children << (MenuItem.create! text: 'Elmira')
mp.children << (m1 = MenuItem.create! text: 'Massachusetts')
m1.children << (MenuItem.create! text: 'Arlington')
m1.children << (MenuItem.create! text: 'Belmont')
m1.children << (MenuItem.create! text: 'Cambridge')

menubar.save!

