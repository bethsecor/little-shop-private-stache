# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
pic = "http://i.imgur.com/kMx8J0g.png"
stache_1 = Stache.create(name: "Handlebar", description: "things", price: 5.0,
                         image_url: pic)
stache_2 = Stache.create(name: "Chevron", description: "things", price: 3.0,
                         image_url: pic)
stache_3 = Stache.create(name: "Dali", description: "things", price: 10.0,
                         image_url: pic)
stache_4 = Stache.create(name: "English", description: "things", price: 9.0,
                         image_url: pic)
stache_5 = Stache.create(name: "Fu Manchu", description: "things", price: 4.0,
                         image_url: pic)
stache_6 = Stache.create(name: "Pencil", description: "things", price: 4.0,
                         image_url: pic)
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

user_1 = User.create(username: "beth", password: "123")
stache_7 = Stache.create(name: "Mustachio",
                         description: "things",
                         price: 50.00,
                         retired: true,
                         image_url: pic)
stache_8 = Stache.create(name: "The Lenny",
                         description: "A true mustache.",
                         price: 5000.00,
                         retired: true,
                         image_url: pic)
order_1 = Order.new

order_stache_1 = OrderStache.create(order_id: order_1.id,
                                    stache_id: stache_1.id,
                                    quantity: 2)
order_stache_2 = OrderStache.create(order_id: order_1.id,
                                    stache_id: stache_2.id,
                                    quantity: 9)
order_stache_3 = OrderStache.create(order_id: order_1.id,
                                    stache_id: stache_8.id,
                                    quantity: 1)

order_1.order_staches << order_stache_1
order_1.order_staches << order_stache_2
order_1.order_staches << order_stache_3

user_1.orders << order_1

order_2 = Order.new(status: "paid")

order_stache_4 = OrderStache.create(order_id: order_2.id,
                                    stache_id: stache_5.id,
                                    quantity: 3)
order_stache_5 = OrderStache.create(order_id: order_2.id,
                                    stache_id: stache_2.id,
                                    quantity: 100)
order_stache_6 = OrderStache.create(order_id: order_2.id,
                                    stache_id: stache_7.id,
                                    quantity: 84)

order_2.order_staches << order_stache_4
order_2.order_staches << order_stache_5
order_2.order_staches << order_stache_6

user_1.orders << order_2

user_2 = User.create(username: "steve", password: "123")
order_3 = Order.new

order_stache_7 = OrderStache.create(order_id: order_3.id,
                                    stache_id: stache_1.id,
                                    quantity: 60)
order_stache_8 = OrderStache.create(order_id: order_3.id,
                                    stache_id: stache_2.id,
                                    quantity: 99)
order_stache_9 = OrderStache.create(order_id: order_3.id,
                                    stache_id: stache_8.id,
                                    quantity: 13)

order_3.order_staches << order_stache_7
order_3.order_staches << order_stache_8
order_3.order_staches << order_stache_9

user_2.orders << order_3

admin = User.create(username: "swanson", password: "stache", role: 1)
