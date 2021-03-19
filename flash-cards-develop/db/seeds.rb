# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  {
    name: 'default',
    email: 'default@test.com',
    password: '123123',
    password_confirmation: '123123'
  },
  {
    name: 'admin',
    email: 'admin@test.com',
    password: '123123',
    password_confirmation: '123123'
  }
])

Category.create!([
               {
                 name: 'Language'
               },
               {
                 name: 'History'
               },
               {
                 name: 'Math'
               }
             ])
Collection.create!([
               {
                 title: 'General',
                 description: "There are some words that'll be useful for you!",
                 category_id: 1,
                 user_id: 1
               },
               {
                 title: 'Transport',
                 description: 'Learn transport!',
                 category_id: 1,
                 user_id: 2
               },
               {
                 title: 'Other',
                 description: 'Some words...',
                 category_id: 1,
                 user_id: 1
               },
               {
                 title: 'Geometry terms',
                 description: 'Learn this math terms!',
                 category_id: 3,
                 user_id: 2
               },
               {
                 title: 'Graphs',
                 description: 'Do you know all about graphs?',
                 category_id: 3,
                 user_id: 2
               },
             ])
Card.create!([
               {
                 front: "Hello",
                 back: "Привіт",
                 category: "General",
                 collection_id: 1
               },
               {
                 front: "Goodbye",
                 back: "До побачення",
                 category: "General",
                 collection_id: 1
               },
               {
                 front: "Car",
                 back: "Машина",
                 category: "General",
                 collection_id: 1
               },
               {
                 front: "Apple",
                 back: "Яблучко",
                 category: "Other",
                 collection_id: 3
               },
               {
                 front: "Ship",
                 back: "Корабель",
                 category: "Transport",
                 collection_id: 2
               },
               {
                 front: "Bus",
                 back: "Автобус",
                 category: "Transport",
                 collection_id: 2
               },
               {
                 front: "Plane",
                 back: "Літак",
                 category: "Transport",
                 collection_id: 2
               },
               {
                 front: "Bike",
                 back: "Велосипед",
                 category: "Transport",
                 collection_id: 2
               },
               {
                 front: "Train",
                 back: "Поїзд",
                 category: "Transport",
                 collection_id: 2
               },
               {
                 front: "Rocket",
                 back: "Ракета",
                 category: "Transport",
                 collection_id: 2
               },
               {
                 front: "Boat",
                 back: "Човен",
                 category: "Transport",
                 collection_id: 2
               },
               {
                 front: "Acute Angle",
                 back: "angle smaller than 90 degrees",
                 collection_id: 4
               },
               {
                 front: "Acute Triangle",
                 back: "a triangle with all acute angle",
                 collection_id: 4
               },
               {
                 front: "Adjacent Angle",
                 back: "an angle next to another angle",
                 collection_id: 4
               },
               {
                 front: "Degree",
                 back: "the measure of an angle",
                 collection_id: 4
               },
               {
                 front: "Equilateral Triangle",
                 back: "a triangle with all three sides and angles are equal",
                 collection_id: 4
               },
               {
                 front: "Isosceles Triangle",
                 back: "a triangle with two equal sides",
                 collection_id: 4
               },
               {
                 front: "Obtuse Angle",
                 back: "angle larger than 90 degrees",
                 collection_id: 4
               },
               {
                 front: "Area",
                 back: "the amount of space the shape covers; measured in square units",
                 collection_id: 4
               },
               {
                 front: "Vertex",
                 back: "the point where two lines meet on a shape",
                 collection_id: 4
               },
               {
                 front: "Data",
                 back: "collected information organized in a graph",
                 collection_id: 5
               },
               {
                 front: "Mean",
                 back: "average; the sum of all the values in the set divided by the amount of numbers given in a set of data",
                 collection_id: 5
               },
               {
                 front: "Median",
                 back: "middlemost number in a set of data",
                 collection_id: 5
               },
               {
                 front: "Mode",
                 back: "number most often used in a set of data",
                 collection_id: 5
               },
               {
                 front: "Range",
                 back: "difference between the highest value and lowest value in a set of data",
                 collection_id: 5
               },
               {
                 front: "Histogram",
                 back: "graph using bars to show the frequency of numbers in the data set",
                 collection_id: 5
               },
               {
                 front: "Lower Quartile",
                 back: "median of the first half of numbers in the set of data",
                 collection_id: 5
               },
               {
                 front: "Interquartile Range",
                 back: "difference between quartile 3 and quartile 1; measure of spread",
                 collection_id: 5
               }
             ])



