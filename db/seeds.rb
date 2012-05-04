# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Menu.delete_all

menubar = Menubar.create!

menubar.children << (Menu.create! text: 'Home')
menubar.children << (mp = Menu.create! text: 'Products')
menubar.save!

mp.children << (Menu.create! text: 'Product 1')
mp.children << (Menu.create! text: 'Product 2')
mp.save!




