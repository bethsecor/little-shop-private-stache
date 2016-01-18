# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
description = "Raw denim paleo brunch, +1 cold-pressed fanny pack
intelligentsia cred. Thundercats small batch gastropub, sartorial hella you
probably haven't heard of them occupy before they sold out migas bicycle
rights tacos"
pic = "http://i.imgur.com/kMx8J0g.png"
stache_1 = Stache.create(name: "Handlebar", description: description, price: 5.0,
                         image_url: "http://i.imgur.com/4NHyiF6.png")
stache_2 = Stache.create(name: "Chevron", description: description, price: 3.0,
                         image_url: "http://i.imgur.com/16uh0nF.png")
stache_3 = Stache.create(name: "Dali", description: description, price: 10.0,
                         image_url: "http://i.imgur.com/3J3agKC.png")
stache_4 = Stache.create(name: "English", description: description, price: 9.0,
                         image_url: "http://i.imgur.com/Ia027l3.png")
stache_5 = Stache.create(name: "Denim Soul", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/29KrsNC.png")
stache_6 = Stache.create(name: "Gastropub", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/Rdrd1Ph.png")
stache_7 = Stache.create(name: "Too Cool", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/sWH2YXv.png")
stache_8 = Stache.create(name: "I Don't Care", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/UaWJ4ub.png")
stache_9 = Stache.create(name: "Arrrr", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/vctVE2S.png")
stache_10 = Stache.create(name: "Matey", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/sqpx1Ah.png")
stache_11 = Stache.create(name: "'Ol Wood Leg", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/9bD5Rvo.png")
stache_12 = Stache.create(name: "Shiver Me Timbers", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/RShmizO.png")
stache_13 = Stache.create(name: "Fabulous", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/oRpl6IL.png")
stache_14 = Stache.create(name: "Diva", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/eV1i2oy.png")
stache_15 = Stache.create(name: "Yay!", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/LM4paeF.png")
stache_16 = Stache.create(name: "Special", description: description, price: 4.0,
                         image_url: "http://i.imgur.com/XtsVPx6.png")

cat_1 = Category.create(title: "Old Fashioned")
cat_2 = Category.create(title: "Hipster")
cat_3 = Category.create(title: "Pirate")
cat_4 = Category.create(title: "Flamboyant")
stache_1.categories << cat_1
stache_2.categories << cat_1
stache_3.categories << cat_1
stache_4.categories << cat_1
stache_5.categories << cat_2
stache_6.categories << cat_2
stache_7.categories << cat_2
stache_8.categories << cat_2
stache_9.categories << cat_3
stache_10.categories << cat_3
stache_11.categories << cat_3
stache_12.categories << cat_3
stache_13.categories << cat_4
stache_14.categories << cat_4
stache_15.categories << cat_4
stache_16.categories << cat_4

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

order_2 = Order.new

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
