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
  gender: "Female",
  photo_url: 'https://i.picsum.photos/id/1009/5000/7502.jpg?hmac=Uj6crVILzsKbyZreBjHuMiaq_-n30qoHjqP0i7r30r8',
  skin_type: "Oily"
  )

user_2 = User.create!(
  username: "User2",
  email: "example2@bloom.com",
  first_name: "Julia",
  last_name: "Stylez",
  age: 45,
  password: "password",
  verified: true,
  gender: "Female",
  photo_url: 'https://i.picsum.photos/id/1009/5000/7502.jpg?hmac=Uj6crVILzsKbyZreBjHuMiaq_-n30qoHjqP0i7r30r8',
  skin_type: "Dry"
  )

user_3 = User.create!(
  username: "User3",
  email: "example3@bloom.com",
  first_name: "James",
  last_name: "Lames",
  age: 20,
  password: "password",
  verified: true,
  gender: "Genderqueer/Non-Binary",
  photo_url: 'https://i.picsum.photos/id/1009/5000/7502.jpg?hmac=Uj6crVILzsKbyZreBjHuMiaq_-n30qoHjqP0i7r30r8',
  skin_type: "Normal"
  )

puts "Creating your index..."
results = Scraper::MeccaProducts.new.call

puts "Creating reviews..."
  product_1 = Product.first
  product_3 = Product.third
  product_5 = Product.fifth

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
  
  ingredient_1 = Ingredient.first
  ingredient_3 = Ingredient.third
  ingredient_5 = Ingredient.fifth

  ing_rev_1 = IngredientReview.create!(
    user: user_1,
    ingredient: ingredient_1,
    title: "Safe to drink",
    content: "Lorem ipsum dolor sit amet",
    safety_rating: 3,
    efficacy_rating: 3,
    supporting_evidence: "Link to article"
    )

  ing_rev_2 = IngredientReview.create!(
    user: user_1,
    ingredient: ingredient_1,
    title: "Safe on skin",
    content: "Lorem ipsum dolor sit amet",
    safety_rating: 5,
    efficacy_rating: 5,
    supporting_evidence: "Link to article"
    )

  ing_rev_3 = IngredientReview.create!(
    user: user_1,
    ingredient: ingredient_3,
    title: "Don't mix with booze",
    content: "Lorem ipsum dolor sit amet",
    safety_rating: 4,
    efficacy_rating: 5,
    supporting_evidence: "Link to article"
    )

  ing_rev_4 = IngredientReview.create!(
    user: user_1,
    ingredient: ingredient_5,
    title: "do not use if you have skin",
    content: "Lorem ipsum dolor sit amet",
    safety_rating: 4,
    efficacy_rating: 5,
    supporting_evidence: "Link to article"
    )

puts "Seeding done!!!"
