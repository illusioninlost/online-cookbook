# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Recipe
# t.string "name"
# t.string "creator"
# t.string "notes"
# t.string "special_tools"
# t.integer "approximate_time"
# t.string "ingredients"
# t.integer "user_id"

Recipe.create(name: 'fried rice', creator:'A', phone_number: '111-111-1111', notes: 'Add cooled rice onto a hot pan. Cook fast and thoroughly.', 
     special_tools: 'wok, spatula', approximate_time: 20, ingredients: 'rice, sausage, peas, broccoli, carrots');
Recipe.create(name: 'spaghetti', creator:'B',phone_number: '222-111-1111', notes: 'Add noodels in pot and stir occasionally. Add with tomato sauce and additional toppings.', 
     special_tools: 'spatula, fork-like spatula', approximate_time: 10, ingredients: 'hard noodles, tomato sauce, meatballs');
Recipe.create(name: 'best chicken wings', creator:'C',phone_number: '333-111-1111', notes: 'defrost wings and add seasoning(salt, pepper,onion, garlic, cheese), deep-fried until crispy. Double deep fried chicken wings for crispier texture.', 
     special_tools: 'large bowl, tongs', approximate_time: 90, ingredients: 'raw chicken wings');
Recipe.create(name: 'classic hamburger', creator:'D',phone_number: '444-111-1111', notes: 'Toast buns; cut lettuce, slice tomotoes and onions and add to buns; grill salt and pepper beef; sandwich these with buns.', 
     special_tools: 'grill,, cutting board', approximate_time: 60, ingredients: 'buns, lettuce, tomotoes, onions, beef');