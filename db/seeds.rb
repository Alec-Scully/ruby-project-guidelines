Mall.destroy_all
Store.destroy_all
Gift.destroy_all
GiftItem.destroy_all


#malls
mall1 = Mall.create(name: "The Galleria", location: "Houston, TX")
mall2 = Mall.create(name: "River Oaks District", location: "Houston, TX")
mall3 = Mall.create(name: "Meyerland Plaza", location: "Houston, TX")
mall4 = Mall.create(name: "Memorial City Mall", location: "Houston, TX")
mall5 = Mall.create(name: "King of Prussia Mall", location: "King of Prussia, PA")
mall6 = Mall.create(name: "Granite Run Mall", location: "Media, PA")
mall7 = Mall.create(name: "Springfield Mall", location: "Springfield, PA")

#stores
store1 = Store.create(name: "Old Navy", store_type: "Clothing Store") 
store2 = Store.create(name: "Zales", store_type: "Jewelry Store") 
store3 = Store.create(name: "Michael Kors", store_type: "Purse Store") 
store4 = Store.create(name: "Steve Maden", store_type: "Shoe Store") 
store5 = Store.create(name: "Kohl's", store_type: "Clothing Store")
store6 = Store.create(name: "Game Stop", store_type: "Video Game Store")
store7 = Store.create(name: "Comics n' Stuff", store_type: "Comic Store")



#gifts
gift1 = Gift.create(name: "Sneakers", price: 60.00, gift_type: "Shoe")
gift2 = Gift.create(name: "Summer Tee", price: 30, gift_type: "Clothing") 
gift3 = Gift.create(name: "Michael Kors Zibra Pattern", price: 300, gift_type: "Purse")
gift4 = Gift.create(name: "Mega Diamond", price: 500000, gift_type:"Jewelry") 
gift5 = Gift.create(name: "Platforms", price: 150, gift_type: "Shoe") 
gift6 = Gift.create(name: "Tetris", price: 5, gift_type: "Game") 
gift7 = Gift.create(name: "Spiderman Comic", price: 150, gift_type: "Comic")
gift8 = Gift.create(name: "Nice Necklace", price: 80, gift_type: "Jewelry")
gift9 = Gift.create(name: "Engagement Ring", price: 1650, gift_type: "Jewelry")
gift10 = Gift.create(name: "Michael Kors Silver Clutch", price: 120, gift_type: "Purse")
gift11 = Gift.create(name: "High Heeled Shoes", price: 100, gift_type: "Shoe")


#gift_items
gi1 = GiftItem.create(store_id: store1.id, gift_id: gift1.id) #
gi2 = GiftItem.create(store_id: store1.id, gift_id: gift2.id) 
gi3 = GiftItem.create(store_id: store1.id, gift_id: gift5.id) 

gi4 = GiftItem.create(store_id: store2.id, gift_id: gift4.id) #
gi5 = GiftItem.create(store_id: store2.id, gift_id: gift8.id) 
gi6 = GiftItem.create(store_id: store2.id, gift_id: gift9.id) 

gi7 = GiftItem.create(store_id: store3.id, gift_id: gift3.id) #
gi8 = GiftItem.create(store_id: store3.id, gift_id: gift10.id) 

gi10 = GiftItem.create(store_id: store4.id, gift_id: gift5.id) #
gi11 = GiftItem.create(store_id: store4.id, gift_id: gift11.id) 

gi13 = GiftItem.create(store_id: store5.id, gift_id: gift1.id) #
gi14 = GiftItem.create(store_id: store5.id, gift_id: gift2.id) 
gi15 = GiftItem.create(store_id: store5.id, gift_id: gift5.id) 
gi16 = GiftItem.create(store_id: store5.id, gift_id: gift8.id) 
gi17 = GiftItem.create(store_id: store5.id, gift_id: gift11.id) 

gi18 = GiftItem.create(store_id: store6.id, gift_id: gift6.id) #
gi19 = GiftItem.create(store_id: store6.id, gift_id: gift7.id) 

gi20 = GiftItem.create(store_id: store7.id, gift_id: gift7.id) #


puts "Seed file ran!"