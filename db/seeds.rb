# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# #Product Types
# ProductType.destroy_all
# ProductType.reset_pk_sequence
# ProductType.create([{
#   name:"Normal"
# },
# {
#   name:"Bidable"
# },
# {
#   name:"Negotiable"
# }])
# p "Created #{ProductType.count} product types !"

# #Product Categories
# ProductCategory.destroy_all
# ProductCategory.reset_pk_sequence
# ProductCategory.create([{
#   name:"Electronic Devices"
# },
# {
#   name:"Electronic Accessories"
# },
# {
#   name:"TV and Home Appliances"
# },
# {
#   name:"Health & Beauty"
# },
# {
#   name:"Babies & Toys"
# },
# {
#   name:"Groceries & Pets"
# },
# {
#   name:"Home & Lifestyle"
# },
# {
#   name:"Women Fashion"
# },
# {
#   name:"Men Fashion"
# },
# {
#   name:"Watches, Bags and Jewellery"
# },
# {
#   name:"Sports and Outdoor"
# }])
# p "Created #{ProductCategory.count} product categories !"

# #Product Sub-Categories
# ProductSubCategory.destroy_all
# ProductSubCategory.reset_pk_sequence
# ProductSubCategory.create([{
#   name:"Smart Phone",
#   product_category_id:1
# },
# {
#   name:"Feature Phone",
#   product_category_id:1
# },
# {
#   name:"Tablet",
#   product_category_id:1
# },
# {
#   name:"Landline Phone",
#   product_category_id:1
# },
# {
#   name:"Laptop",
#   product_category_id:1
# },
# {
#   name:"Desktop",
#   product_category_id:1
# },
# {
#   name:"Smart Watch",
#   product_category_id:1
# },
# {
#   name:"Gaming Console",
#   product_category_id:1
# },
# {
#   name:"Cameras and Drone",
#   product_category_id:1
# },
# {
#   name:"Security Camera",
#   product_category_id:1
# },
# {
#   name:"Mobile Accessories",
#   product_category_id:2
# },
# {
#   name:"Headphones and Headsets",
#   product_category_id:2
# },
# {
#   name:"Wearable",
#   product_category_id:2
# },
# {
#   name:"Camera Accessories",
#   product_category_id:2
# },
# {
#   name:"Computer Accessories",
#   product_category_id:2
# },
# {
#   name:"Storage",
#   product_category_id:2
# },
# {
#   name:"Printers",
#   product_category_id:2
# },
# {
#   name:"Computer Components",
#   product_category_id:2
# },
# {
#   name:"Network Components",
#   product_category_id:2
# },
# {
#   name:"Portable Speakers",
#   product_category_id:2
# },
# {
#   name:"LED televisions",
#   product_category_id:3
# },
# {
#   name:"Smart televisions",
#   product_category_id:3
# },
# {
#   name:"Home Audio and Theater",
#   product_category_id:3
# },
# {
#   name:"TV Accessories",
#   product_category_id:3
# },
# {
#   name:"Kitchen appliances",
#   product_category_id:3
# },
# {
#   name:"Cooling and Heating",
#   product_category_id:3
# },
# {
#   name:"Irons and Garment care",
#   product_category_id:3
# },
# {
#   name:"Vacuum and floor care",
#   product_category_id:3
# },
# {
#   name:"Generator and Portable power",
#   product_category_id:3
# },
# {
#   name:"Washers and Dryers",
#   product_category_id:3
# },
# {
#   name:"Bath and body",
#   product_category_id:4
# },
# {
#   name:"Beauty tools",
#   product_category_id:4
# },
# {
#   name:"Fragrances",
#   product_category_id:4
# },
# {
#   name:"Hair Care",
#   product_category_id:4
# },
# {
#   name:"Makeup",
#   product_category_id:4
# },
# {
#   name:"Men’s Care",
#   product_category_id:4
# },
# {
#   name:"Personal care",
#   product_category_id:4
# },
# {
#   name:"Skin care",
#   product_category_id:4
# },
# {
#   name:"Medical supplies",
#   product_category_id:4
# },
# {
#   name:"Diapers",
#   product_category_id:5
# },
# {
#   name:"Milk Formulas and baby food",
#   product_category_id:5
# },
# {
#   name:"Feeding",
#   product_category_id:5
# },
# {
#   name:"Baby gear",
#   product_category_id:5
# },
# {
#   name:"Baby and toddler toys",
#   product_category_id:5
# },
# {
#   name:"Remote control and vehicles",
#   product_category_id:5
# },
# {
#   name:"Sports and outdoor play",
#   product_category_id:5
# },
# {
#   name:"Nursery",
#   product_category_id:5
# },
# {
#   name:"Baby personal care",
#   product_category_id:5
# },
# {
#   name:"Clothing and Accessories",
#   product_category_id:5
# },
# {
#   name:"Toys and Games",
#   product_category_id:5
# },
# {
#   name:"Beverages",
#   product_category_id:6
# },
# {
#   name:"Fresh products",
#   product_category_id:6
# },
# {
#   name:"Bakery items",
#   product_category_id:6
# },
# {
#   name:"Food staples",
#   product_category_id:6
# },
# {
#   name:"Dairy and chilled",
#   product_category_id:6
# },
# {
#   name:"Laundry and Household",
#   product_category_id:6
# },
# {
#   name:"Cat",
#   product_category_id:6
# },
# {
#   name:"Dog",
#   product_category_id:6
# },
# {
#   name:"Fish",
#   product_category_id:6
# },
# {
#   name:"Frozen foods",
#   product_category_id:6
# },
# {
#   name:"Bath",
#   product_category_id:7
# },
# {
#   name:"Bedding",
#   product_category_id:7
# },
# {
#   name:"Decor",
#   product_category_id:7
# },
# {
#   name:"Furniture",
#   product_category_id:7
# },
# {
#   name:"Kitchen and dining",
#   product_category_id:7
# },
# {
#   name:"Lighting",
#   product_category_id:7
# },
# {
#   name:"Laundry and cleaning",
#   product_category_id:7
# },
# {
#   name:"Tools, DIY and outdoor",
#   product_category_id:7
# },
# {
#   name:"Stationery and Craft",
#   product_category_id:7
# },
# {
#   name:"Media, Music and Books",
#   product_category_id:7
# },
# {
#   name:"Unstitched fabric",
#   product_category_id:8
# },
# {
#   name:"Kurtas and shalwar kameez",
#   product_category_id:8
# },
# {
#   name:"Muslim wear",
#   product_category_id:8
# },
# {
#   name:"Western wear",
#   product_category_id:8
# },
# {
#   name:"Sleepwear",
#   product_category_id:8
# },
# {
#   name:"Inner wear",
#   product_category_id:8
# },
# {
#   name:"Pants, jeans and leggings",
#   product_category_id:8
# },
# {
#   name:"Dresses and skirts",
#   product_category_id:8
# },
# {
#   name:"Winter clothing",
#   product_category_id:8
# },
# {
#   name:"Shoes",
#   product_category_id:8
# },
# {
#   name:"Girl’s clothing",
#   product_category_id:8
# },
# {
#   name:"Girl’s shoes",
#   product_category_id:8
# },
# {
#   name:"T-shirt and tanks",
#   product_category_id:9
# },
# {
#   name:"Shirt and Polo",
#   product_category_id:9
# },
# {
#   name:"Pant and jeans",
#   product_category_id:9
# },
# {
#   name:"Shorts, Joggers and sweaters",
#   product_category_id:9
# },
# {
#   name:"Muslim wear",
#   product_category_id:9
# },
# {
#   name:"Inner wear",
#   product_category_id:9
# },
# {
#   name:"Winter clothing",
#   product_category_id:9
# },
# {
#   name:"Shoes",
#   product_category_id:9
# },
# {
#   name:"Accessories",
#   product_category_id:9
# },
# {
#   name:"Boy’s clothing",
#   product_category_id:9
# },
# {
#   name:"Boy’s shoes",
#   product_category_id:9
# },
# {
#   name:"Boy’s accessories",
#   product_category_id:9
# },
# {
#   name:"Men’s watches",
#   product_category_id:10
# },
# {
#   name:"Women’s watches",
#   product_category_id:10
# },
# {
#   name:"Kid’s watches",
#   product_category_id:10
# },
# {
#   name:"Women bags",
#   product_category_id:10
# },
# {
#   name:"Men's bags",
#   product_category_id:10
# },
# {
#   name:"Luggage and suitcase",
#   product_category_id:10
# },
# {
#   name:"Women accessories",
#   product_category_id:10
# },
# {
#   name:"Men accessories",
#   product_category_id:10
# },
# {
#   name:"Sunglasses and Eyewear",
#   product_category_id:10
# },
# {
#   name:"Exercise and fitness",
#   product_category_id:11
# },
# {
#   name:"Supplements",
#   product_category_id:11
# },
# {
#   name:"Shoes and Clothing",
#   product_category_id:11
# },
# {
#   name:"Team sports",
#   product_category_id:11
# },
# {
#   name:"Racket sports",
#   product_category_id:11
# },
# {
#   name:"Outdoor recreation",
#   product_category_id:11
# },
# {
#   name:"Fitness Gadgets",
#   product_category_id:11
# },
# {
#   name:"Sports Accessories",
#   product_category_id:11
# }])
# p "Created #{ProductSubCategory.count} product sub-categories !"
