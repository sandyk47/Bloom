require "open-uri"

IngredientReview.delete_all
ProductReview.delete_all
ProductIngredient.delete_all
Ingredient.delete_all
Product.delete_all
Brand.delete_all
User.delete_all

puts "Preparing your app..."
puts "Creating users..."

user_1 = User.create!(
username: "schung94",
email: "schung94@bloom.com",
first_name: "Shannon",
last_name: "Chung",
age: 26,
password: "password",
verified: false,
gender: "Female",
photo_url: 'https://puu.sh/GUWsb/6dbe05eed2.png',
skin_type: "Oily"
)

user_2 = User.create!(
username: "Garboss87",
email: "garboss87@bloom.com",
first_name: "Julia",
last_name: "Garner",
age: 33,
password: "password",
verified: false,
gender: "Female",
photo_url: 'https://puu.sh/GUWvk/5a774319df.png',
skin_type: "Dry"
)

user_3 = User.create!(
username: "badnastyyy",
email: "badnastyyy@bloom.com",
first_name: "Bretman",
last_name: "Stone",
age: 22,
password: "password",
verified: false,
gender: "Genderqueer/Non-Binary",
photo_url: 'https://puu.sh/GUWvO/06d767a846.png',
skin_type: "Normal"
)

user_4 = User.create!(
username: "jamescharles",
email: "jamescharles@bloom.com",
first_name: "James",
last_name: "Charles",
age: 21,
password: "password",
verified: true,
gender: "Genderqueer/Non-Binary",
photo_url: 'https://puu.sh/GUWUC/86d967b695.png',
skin_type: "Normal"
)

user_5 = User.create!(
username: "drbonnieveysey",
email: "drbonnieveysey@bloom.com",
first_name: "Dr. Bonnie",
last_name: "Veysey",
age: 48,
password: "password",
verified: true,
gender: "Female",
photo_url: 'https://puu.sh/GUWOp/e734262b88.png',
skin_type: "Normal"
)

user_6 = User.create!(
username: "drmichelle.saluja",
email: "dr.michelle.saluja@bloom.com",
first_name: "Michelle",
last_name: "Saluja",
age: 32,
password: "password",
verified: true,
gender: "Female",
photo_url: 'https://puu.sh/GUWRs/486c00ed1d.png',
skin_type: "Normal"
)

puts "Creating your index..."
Scraper::MeccaProducts.new.call

puts "Creating product ingredients"
ProductIngredient.create!(ingredient: Ingredient.first, product: Product.first)
ProductIngredient.create!(ingredient: Ingredient.first, product: Product.second)
ProductIngredient.create!(ingredient: Ingredient.first, product: Product.last)


puts "Creating reviews..."
product_1 = Product.find(12)
product_2 = Product.find(35)
product_3 = Product.find(32)

pro_rev_1 = ProductReview.create!(
user: user_2,
product: product_1,
title: "Left dry skin feeling refreshed",
content: "Amazing product! I normally suffer from dry and easily irritated skin... but with Kylie Skin's face moisturizer I could feel the effects almost immediately, and its kept my skin nice and hydrated throughout the day.",
product_rating: 5,
)

pro_rev_2 = ProductReview.create!(
user: user_3,
product: product_2,
title: "COELIACS BEWARE!!!!!!!",
content: "This skin company is nasty, and not in the good kind of way. I'm a coeliac and this Resurfacing Essence turned my face from a vision of beauty to a rash ridden mess! Clearly the yeast extract comes from barley or something, WHICH THE COMPANY SHOULD DISCLOSE!!!! ",
product_rating: 1,
)

pro_rev_2 = ProductReview.create!(
user: user_2,
product: product_2,
title: "A tad expensive, but worth it!",
content: "Left my face feeling firmed up and ready for summer, highly recommend, wouldn't use it everyday though, tad pricey.",
product_rating: 4,
)
  
pro_rev_3 = ProductReview.create!(
user: user_3,
product: product_3,
title: "YASSSS DIS SOME GOOD SHIT!!!!",
content: "Goopgenes is da bomb! Left my face feeling amazingly refreshed, and best of all, NO REACTION! Coeliac tested and approved!",
product_rating: 5,
)
  
pro_rev_4 = ProductReview.create!(
user: user_2,
product: product_3,
title: "Light up higher!",
content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempoincididunt ut labore et dolore magna aliqua.",
product_rating: 4,
)
      
ingredient_1 = Ingredient.find(330)
ingredient_2 = Ingredient.find(1069)
ingredient_3 = Ingredient.find(1026)

ing_rev_1 = IngredientReview.create!(
user: user_4,
ingredient: ingredient_1,
title: "Good for cleansing skin, however Coeliacs beware",
content: "Avena Sativa (Oat) Bran Extract is good at leaving your skin looking clean and fresh! It's super gentle too, love it to bits! However coeliacs be safeeeeeee, this stuff ain't good for you!",
safety_rating: 8,
efficacy_rating: 9,
supporting_evidence: "Journal of Zhejiang University Science B, 2013, issue 2, pages 97-105"
)

ing_rev_2 = IngredientReview.create!(
user: user_5,
ingredient: ingredient_1,
title: "Antioxidant, Moisturizer and Soothener",
content: "Yeast extract is a mixture of flavonoids, sugars, vitamins, and amino acids. This unique derivative of fungi also contains a high concentration of antioxidants, which acapable of neutralizing harmful free-radicals that are present in the environment. The protective mechanism not only helps to maintain the skin’s overall quality and appearancbut also allows additional skin care advantages such as increased moisturizing and soothing properties. However, skincare companies do not have to divulge the source of their yeast extract, so coeliacs should keep that in mind.",
safety_rating: 9,
efficacy_rating: 10,
supporting_evidence: "Lods, L. M. et al. The future of enzymes in cosmetics. International journal of cosmetic science 22.2, 85-94 (2000)"
)

ing_rev_3 = IngredientReview.create!(
user: user_6,
ingredient: ingredient_3,
title: "Good source of necessary antioxidants and vitamin E",
content: "Oryza sativa (rice) bran extract is a plant ingredient used in cosmetics to condition and soften skin. It’s also a chelating agent. The bran is the brown outer layer of the rice kernel. It’s a by-product from milling of rice, but don’t take that to mean it’s a throwaway ingredient: rice bran is a rich source of over 100 antioxidant compounds, including vitamin E, ferulic acid, and oryzanol.",
safety_rating: 10,
efficacy_rating: 8,
supporting_evidence: "Critical Reviews in Food Science and Nutrition, November 2017, pages 3,771-3,780"
)

ing_rev_4 = IngredientReview.create!(
user: user_4,
ingredient: ingredient_3,
title: "Conditions and Softens",
content: "Rice bran extract is used to help moisturize and cleanse skin, and also happens to be coeliac friendly! There might be concerns if you have reactions to pesticides though so choose your brand carefully or you gonna get all that bad stuff up in your system.",
safety_rating: 8,
efficacy_rating: 7,
supporting_evidence: "CIR (Cosmetic Ingredient Review). 2006. CIR Compendium, containing abstracts, discussions, and conclusions of CIR cosmetic ingredient safety assessments. Washington DC."
)

puts "Seeding done!!!"
