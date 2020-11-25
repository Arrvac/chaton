# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Cart.destroy_all
Item.destroy_all
Carditem.destroy_all
AssociateOrderItem.destroy_all
Carditem.destroy_all
Order.destroy_all

cart_tmp = Cart.create
User.create(email: "nico@yopmail.com", password: "password", cart: cart_tmp, is_admin?: true)