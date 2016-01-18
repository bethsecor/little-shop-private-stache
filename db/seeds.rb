description = "Raw denim paleo brunch, +1 cold-pressed fanny pack
intelligentsia cred. Thundercats small batch gastropub, sartorial hella you
probably haven't heard of them occupy before they sold out migas bicycle
rights tacos"

pic = "http://i.imgur.com/kMx8J0g.png"

cat_1 = Category.create(title: "Old Fashioned")
cat_2 = Category.create(title: "Hipster")
cat_3 = Category.create(title: "Pirate")
cat_4 = Category.create(title: "Flamboyant")

# some variable assigments kept for order creation down below
stache_1 = cat_1.staches.create(
                         name: "Fluffer", description: description,
                         price: 5.0,
                         image_url: "http://i.imgur.com/4NHyiF6.png",
                         stache_url: "http://i.imgur.com/HWGUgox.png")
stache_2 = cat_1.staches.create(
                         name: "Chevron", description: description,
                         price: 3.0,
                         image_url: "http://i.imgur.com/16uh0nF.png",
                         stache_url: "http://i.imgur.com/Qjwi1YV.png")
cat_1.staches.create(name: "Trapper", description: description, price: 10.0,
                     image_url: "http://i.imgur.com/3J3agKC.png",
                     stache_url: "http://i.imgur.com/rJ71NVK.png")
cat_1.staches.create(name: "Roosevelt", description: description, price: 9.0,
                     image_url: "http://i.imgur.com/Ia027l3.png",
                     stache_url: "http://i.imgur.com/IfWnBMd.png")
stache_5 = cat_2.staches.create(
                         name: "Denim Soul", description: description,
                         price: 4.0,
                         image_url: "http://i.imgur.com/29KrsNC.png",
                         stache_url: "http://i.imgur.com/xvAxx8E.png")
cat_2.staches.create(name: "Gastropub", description: description,
                     price: 4.0,
                     image_url: "http://i.imgur.com/Rdrd1Ph.png",
                     stache_url: "http://i.imgur.com/NCMIMQy.png")
cat_2.staches.create(name: "Too Cool", description: description,
                     price: 4.0,
                     image_url: "http://i.imgur.com/sWH2YXv.png",
                     stache_url: "http://i.imgur.com/MQEXa4Y.png")
cat_2.staches.create(name: "I'm Bored", description: description,
                     price: 4.0,
                     image_url: "http://i.imgur.com/UaWJ4ub.png",
                     stache_url: "http://i.imgur.com/PLHQykF.png")
cat_3.staches.create(name: "Arrrr", description: description, price: 4.0,
                     image_url: "http://i.imgur.com/vctVE2S.png",
                     stache_url: "http://i.imgur.com/ts6Cs7W.png")
cat_3.staches.create(name: "Matey", description: description, price: 4.0,
                     image_url: "http://i.imgur.com/sqpx1Ah.png",
                     stache_url: "http://i.imgur.com/zHitnkQ.png")
cat_3.staches.create(name: "'Ol Wood Leg", description: description,
                     price: 4.0,
                     image_url: "http://i.imgur.com/9bD5Rvo.png",
                     stache_url: "http://i.imgur.com/BDXPjkM.png")
cat_3.staches.create(name: "Shiver Me Timbers", description: description,
                     price: 4.0,
                     image_url: "http://i.imgur.com/RShmizO.png",
                     stache_url: "http://i.imgur.com/yExd7hd.png")
cat_4.staches.create(name: "Fabulous", description: description,
                     price: 4.0,
                     image_url: "http://i.imgur.com/oRpl6IL.png",
                     stache_url: "http://i.imgur.com/SKWzHIb.png")
cat_4.staches.create(name: "Diva", description: description, price: 4.0,
                     image_url: "http://i.imgur.com/eV1i2oy.png",
                     stache_url: "http://i.imgur.com/f0EAa6p.png")
cat_4.staches.create(name: "Kitten", description: description, price: 4.0,
                     image_url: "http://i.imgur.com/LM4paeF.png",
                     stache_url: "http://i.imgur.com/cx1omcB.png")
cat_4.staches.create(name: "Yay!", description: description, price: 4.0,
                     image_url: "http://i.imgur.com/XtsVPx6.png",
                     stache_url: "http://i.imgur.com/UfIug97.png")

user_1 = User.create(username: "beth", password: "123")
stache_17 = Stache.create(name: "Mustachio",
                         description: "things",
                         price: 50.00,
                         retired: true,
                         image_url: pic)
stache_18 = Stache.create(name: "The Lenny",
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
                                    stache_id: stache_18.id,
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
                                    stache_id: stache_17.id,
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
                                    stache_id: stache_18.id,
                                    quantity: 13)

order_3.order_staches << order_stache_7
order_3.order_staches << order_stache_8
order_3.order_staches << order_stache_9

user_2.orders << order_3
