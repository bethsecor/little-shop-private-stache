# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stache_1 = Stache.create(name: "Handlebar", description: "things", price: 5.0,
                         image_url: "http://images.clipartpanda.com/
                                     mustache-clipart-ecMA4abcn.svg")
stache_2 = Stache.create(name: "Chevron", description: "things", price: 3.0,
                         image_url: "http://images.clipartpanda.com/
                                     mustache-clipart-ecMA4abcn.svg")
stache_3 = Stache.create(name: "Dali", description: "things", price: 10.0,
                         image_url: "http://images.clipartpanda.com/
                         mustache-clipart-ecMA4abcn.svg")
stache_4 = Stache.create(name: "English", description: "things", price: 9.0,
                         image_url: "http://images.clipartpanda.com/
                                     mustache-clipart-ecMA4abcn.svg")
stache_5 = Stache.create(name: "Fu Manchu", description: "things", price: 4.0,
                         image_url: "http://images.clipartpanda.com/
                                     mustache-clipart-ecMA4abcn.svg")
stache_6 = Stache.create(name: "Pencil", description: "things", price: 4.0,
                         image_url: "http://images.clipartpanda.com/
                                     mustache-clipart-ecMA4abcn.svg")
cat_1 = Category.create(title: "Cowboy")
cat_2 = Category.create(title: "Hipster")
cat_3 = Category.create(title: "Old English")
cat_4 = Category.create(title: "Hobo")
stache_1.categories << cat_1
stache_2.categories << cat_2
stache_3.categories << cat_3
stache_4.categories << cat_4
stache_5.categories << cat_1
stache_6.categories << cat_2

user = User.create(username: "beth", password: "123")
stache_7 = Stache.create(name: "Mustachio",
                         description: "things",
                         price: 50.00,
                         retired: true,
                         image_url: "http://images.clipartpanda.com/
                                     mustache-clipart-ecMA4abcn.svg")
stache_8 = Stache.create(name: "The Lenny",
                        description: "A true mustache.",
                        price: 5000.00,
                        retired: true,
                        image_url: "http://images.clipartpanda.com/
                                    mustache-clipart-ecMA4abcn.svg")
order = Order.new

order_stache_1 = OrderStache.create(order_id: order.id,
                                    stache_id: stache_1.id,
                                    quantity: 2)
order_stache_2 = OrderStache.create(order_id: order.id,
                                    stache_id: stache_2.id,
                                    quantity: 9)
order_stache_3 = OrderStache.create(order_id: order.id,
                                    stache_id: stache_8.id,
                                    quantity: 1)

order.order_staches << order_stache_1
order.order_staches << order_stache_2
order.order_staches << order_stache_3

user.orders << order
