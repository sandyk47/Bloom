require "open-uri"

puts "Preparing your app..."
puts "Creating users..."

user_1 = User.create!(
  username: "User1",
  email: "example1@bloom.com",
  first_name: "Rick",
  last_name: "Deckard",
  age: 40,
  password: "password",
  verified: true,
  gender: "female",
  photo_url: 'https://i.picsum.photos/id/1009/5000/7502.jpg?hmac=Uj6crVILzsKbyZreBjHuMiaq_-n30qoHjqP0i7r30r8'
  )

user_2 = User.create!(
  username: "User2",
  email: "example2@bloom.com",
  first_name: "Julia",
  last_name: "Stylez",
  age: 45,
  password: "password",
  verified: true,
  gender: "female",
  photo_url: 'https://i.picsum.photos/id/1009/5000/7502.jpg?hmac=Uj6crVILzsKbyZreBjHuMiaq_-n30qoHjqP0i7r30r8'
  )

user_3 = User.create!(
  username: "User3",
  email: "example3@bloom.com",
  first_name: "James",
  last_name: "Lames",
  age: 45,
  password: "password",
  verified: true,
  gender: "male",
  photo_url: 'https://i.picsum.photos/id/1009/5000/7502.jpg?hmac=Uj6crVILzsKbyZreBjHuMiaq_-n30qoHjqP0i7r30r8'
  )

puts "Creating your ingredients..."

ingredient_1 = Ingredient.create!(
  name: "water",
  description: "solvent",
  average_safety_rating: 0,
  average_efficacy_rating: 3
  )

ingredient_2 = Ingredient.create!(
  name: "alcohol",
  description: "solvent",
  average_safety_rating: 1,
  average_efficacy_rating: 1
  )

ingredient_3 = Ingredient.create!(
  name: "benzos",
  description: "calming",
  average_safety_rating: 4,
  average_efficacy_rating: 2
  )

ingredient_4 = Ingredient.create!(
  name: "propane",
  description: "good for everything",
  average_safety_rating: 1,
  average_efficacy_rating: 5
  )

ingredient_5 = Ingredient.create!(
  name: "parabens",
  description: "pra voce",
  average_safety_rating: 5,
  average_efficacy_rating: 5
  )

ingredient_6 = Ingredient.create!(
  name: "sulfuric acid",
  description: "gets rid of everything",
  average_safety_rating: 1,
  average_efficacy_rating: 5
  )

puts "Creating your brands..."

brand_1 = Brand.create!(
  name: "AESOP"
  )

brand_2 = Brand.create!(
  name: "Avene"
  )

brand_3 = Brand.create!(
  name: "NIVEA"
  )
puts "Creating your products..."

  product_1 = Product.create!(
    brand: brand_1,
    title: 'Geranium facial cleanser',
    description: "Clean and smells nice",
    average_product_rating_stars: 1,
    average_safety_rating_bar: 2,
    average_safety_rating_bar: 3
    )

  product_2 = Product.create!(
    brand: brand_1,
    title: 'Exfoliating rose scrub',
    description: "scrub, scrub",
    average_product_rating_stars: 3,
    average_safety_rating_bar: 4,
    average_safety_rating_bar: 4
    )

  product_3 = Product.create!(
    brand: brand_2,
    title: 'Hot-Red concealear',
    description: "so hot",
    average_product_rating_stars: 5,
    average_safety_rating_bar: 2,
    average_safety_rating_bar: 1
    )

  product_4 = Product.create!(
    brand: brand_2,
    title: 'Rusty bronzer',
    description: "rusty-boy",
    average_product_rating_stars: 4,
    average_safety_rating_bar: 4,
    average_safety_rating_bar: 2
    )

  product_5 = Product.create!(
    brand: brand_3,
    title: 'Fluro-highlighter',
    description: "light-up",
    average_product_rating_stars: 3,
    average_safety_rating_bar: 1,
    average_safety_rating_bar: 3
    )

puts "Creating product ingredients..."

  pro_ing_1 = ProductIngredient.create!(
    ingredient: ingredient_1,
    product: product_1
  )

  pro_ing_2 = ProductIngredient.create!(
    ingredient: ingredient_6,
    product: product_1
  )

  pro_ing_3 = ProductIngredient.create!(
    ingredient: ingredient_3,
    product: product_2
  )

  pro_ing_4 = ProductIngredient.create!(
    ingredient: ingredient_4,
    product: product_2
  )

  pro_ing_5 = ProductIngredient.create!(
    ingredient: ingredient_5,
    product: product_3
  )

  pro_ing_6 = ProductIngredient.create!(
    ingredient: ingredient_6,
    product: product_5
  )

puts "Creating reviews..."

  pro_rev_1 = ProductReview.create!(
    user: user_1,
    product: product_1,
    title: "Squeaky CLEAN",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    product_rating: 5,
  )

   pro_rev_2 = ProductReview.create!(
    user: user_2,
    product: product_1,
    title: "not bad, could be better",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    product_rating: 2,
  )

 pro_rev_3 = ProductReview.create!(
    user: user_1,
    product: product_3,
    title: "Conceal don't feel",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    product_rating: 3,
  )

 pro_rev_4 = ProductReview.create!(
    user: user_1,
    product: product_5,
    title: "Light up higher!",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    product_rating: 4,
  )

  ing_rev_1 = IngredientReview.create!(
    user: user_1,
    ingredient: ingredient_1,
    title: "Safe to drink",
    content: "Lorem ipsum dolor sit amet",
    safety_rating: 3,
    efficacy_rating: 3,
    supporting_evidence: ""
    )

  ing_rev_2 = IngredientReview.create!(
    user: user_1,
    ingredient: ingredient_1,
    title: "Safe on skin",
    content: "Lorem ipsum dolor sit amet",
    safety_rating: 5,
    efficacy_rating: 5,
    supporting_evidence: ""
    )

  ing_rev_3 = IngredientReview.create!(
    user: user_1,
    ingredient: ingredient_3,
    title: "Don't mix with booze",
    content: "Lorem ipsum dolor sit amet",
    safety_rating: 4,
    efficacy_rating: 5,
    supporting_evidence: ""
    )

  ing_rev_4 = IngredientReview.create!(
    user: user_1,
    ingredient: ingredient_6,
    title: "do not use if you have skin",
    content: "Lorem ipsum dolor sit amet",
    safety_rating: 4,
    efficacy_rating: 5,
    supporting_evidence: ""
    )

