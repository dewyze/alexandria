# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
store = Store.create(name: "Waldenbooks")
store.books.build(title: "Lord of the Rings")
store.books.build(title: "Flour Water Salt Yeast")
store.books.build(title: "The Giver")
store.save
