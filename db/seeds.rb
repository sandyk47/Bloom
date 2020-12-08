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
%x[rake load_csv:products]

puts "Creating Ingredient description"
ingredient_1 = Ingredient.find(250)
ingredient_2 = Ingredient.find(965)
ingredient_3 = Ingredient.find(583)

ingredient_1.update(description: "Avena Sativa (Oat) kernel flour is the flour produced from the seeds of the Avena Sativa plant and otherwise known as the oat plant. Wild oats were used for skin care purposed by the Egyptians and the Arabs since at least 2000 BC. More recently oatmeal baths have often been used to treat skin inflammatory conditions. Oat bran is a good source of B complex vitamins, vitamin E, protein, fat, and minerals. Additionally, it is rich in beta-glucan which is heart-healthy soluble fiber in particular. Today’s the formulations of colloidal oatmeal are offered in various forms such as bath treatments, cleansing bars, body washes, shampoos, lotions, creams, and shaving gels.")

ingredient_2.update(description: "Yeast extracts consist of the cell contents of yeast without the cell walls;they are used as food additives or flavorings, or as nutrients for bacterial culture media. They are often used to create savory flavors and umami taste sensations, and can be found in a large variety of packaged food, including frozen meals, crackers, snack foods, gravy, stock and more. They are rich in B vitamins (but not B12), and so are of particular importance to vegans and vegetarians. Yeast extracts and fermented foods contain glutamic acid (free glutamates), an amino acid which adds an umami flavor. Glutamic acid is found in meat, cheese, fungi (mushrooms), and vegetables—such as broccoli, and tomatoes.")

ingredient_3.update(description: "Also known as rice bran extract, rice bran oil, Oryza Sativa (Rice Bran) Oil, is the oil extracted from the germ and inner husk of rice. It’s similar to peanut oil, with high percentages of fatty acids—which, by the way, makes it a perfect skin moisturizer! Rice bran oil contains many natural antioxidant phenols, flavonoids, tocopherols, and tocotrienols1. A later study found rice bran oil to contain powerful antioxidants derivatives of ferulic acid, caffeic acid, and vanillic acid2. These antioxidants displayed free strong radical scavenging activity. Vanillic acid and ferulic acid as found in rice bran oil have been shown to have good penetration capabilities for the epidermis and dermis upon topical application. Rice bran oil has also found to be a better source of tocopherol (Vitamin E) and free fatty acids than sunflower oil, safflower oil, and groundnut oil. Rice bran oil contains a higher proportion of short-chain fatty acids than the other oils studied. These are natural emollients and provide good hydration for the skin as well as protecting the skin.")

puts "Creating reviews..."
product_1 = Product.find(1)
product_2 = Product.find(2)
product_3 = Product.find(3)
product_4 = Product.find(4)
product_5 = Product.find(5)
product_6 = Product.find(6)
product_7 = Product.find(7)
product_8 = Product.find(8)
product_9 = Product.find(9)
product_10 = Product.find(10)
product_11 = Product.find(11)
product_12 = Product.find(12)
product_13 = Product.find(13)
product_14 = Product.find(14)
product_15 = Product.find(15)
product_16 = Product.find(16)
product_17 = Product.find(17)
product_18 = Product.find(18)
product_19 = Product.find(19)
product_20 = Product.find(20)
product_21 = Product.find(21)
product_22 = Product.find(22)
product_23 = Product.find(23)
product_24 = Product.find(24)
product_25 = Product.find(25)
product_26 = Product.find(26)
product_27 = Product.find(27)
product_28 = Product.find(28)
product_29 = Product.find(29)
product_30 = Product.find(30)
product_31 = Product.find(31)
product_32 = Product.find(32)
product_33 = Product.find(33)
product_34 = Product.find(34)
product_35 = Product.find(35)

skin_concerns = %w(Blemishes Dark\ circles Dehydration Dullness Fine\ lines Loss\ of\ firmness Pigmentation Puffiness Redness Sun\ damage Uneven\ skin\ texture Uneven\ skin\ tone Visible\ pores Wrinkles)

skin_types = ["All", "Extra Oily", "Oily", "Combination", "Dry", "Extra Dry", "Sensitive", "Normal"]

product_2.accreditation_list.add(["Alcohol-free", "Sulphate-free"])
product_2.save
product_3.accreditation_list.add("Parabens-free")
product_3.save
product_4.accreditation_list.add("Vegan")
product_4.save
product_5.accreditation_list.add("Parabens-free")
product_5.save
product_6.accreditation_list.add(["Parabens-free", "Alcohol-free"])
product_6.save
product_7.accreditation_list.add(["Parabens-free", "Alcohol-free", "Sulphate-free"])
product_7.save
product_10.accreditation_list.add(["Parabens-free", "Vegan", "Sulphate-free"])
product_10.save
product_11.accreditation_list.add("Parabens-free")
product_11.save
product_12.accreditation_list.add("Parabens-free")
product_12.save
product_13.accreditation_list.add(["Parabens-free", "Vegan", "Sulphate-free"])
product_13.save
product_15.accreditation_list.add(["Parabens-free", "Alcohol-free", "Sulphate-free"])
product_15.save
product_16.accreditation_list.add(["Parabens-free", "Vegan", "Sulphate-free"])
product_16.save
product_18.accreditation_list.add(["Parabens-free", "Sulphate-free"])
product_18.save
product_19.accreditation_list.add(["Parabens-free", "Vegan", "Sulphate-free"])
product_19.save
product_20.accreditation_list.add(["Parabens-free", "Oil-free", "Sulphate-free"])
product_20.save
product_21.accreditation_list.add(["Parabens-free", "Vegan", "Sulphate-free"])
product_21.save
product_22.accreditation_list.add(["Parabens-free", "Vegan", "Sulphate-free"])
product_22.save
product_23.accreditation_list.add(["Parabens-free", "Vegan", "Sulphate-free"])
product_23.save
product_25.accreditation_list.add(["Parabens-free", "Sulphate-free", "Gluten-free"])
product_25.save
product_26.accreditation_list.add("Vegan")
product_26.save
product_28.accreditation_list.add("Vegan")
product_28.save
product_29.accreditation_list.add(["Parabens-free", "Vegan", "Oil-free"])
product_29.save
product_31.accreditation_list.add("Parabens-free")
product_31.save
product_32.accreditation_list.add("Parabens-free")
product_32.save
product_33.accreditation_list.add("Parabens-free")
product_33.save
product_35.accreditation_list.add(["Parabens-free", "Sulphate-free"])
product_35.save

Product.all.each do |product|
  product.skin_concern_list.add(skin_concerns.sample)
  product.save
end

Product.all.each do |product|
  product.skin_type_list.add(skin_types.sample)
  product.save
end

pro_rev_1 = ProductReview.create!(
user: user_2,
product: product_10,
title: "Left dry skin feeling refreshed",
content: "Amazing product! I normally suffer from dry and easily irritated skin... but with Kylie Skin's face moisturizer I could feel the effects almost immediately, and its kept my skin nice and hydrated throughout the day.",
product_rating: 5,
)

pro_rev_2 = ProductReview.create!(
user: user_3,
product: product_35,
title: "COELIACS BEWARE!!!!!!!",
content: "This skin company is nasty, and not in the good kind of way. I'm a coeliac and this Resurfacing Essence turned my face from a vision of beauty to a rash ridden mess! Clearly the yeast extract comes from barley or something, WHICH THE COMPANY SHOULD DISCLOSE!!!! ",
product_rating: 1,
)

pro_rev_2 = ProductReview.create!(
user: user_2,
product: product_35,
title: "A tad expensive, but worth it!",
content: "Left my face feeling firmed up and ready for summer, highly recommended, wouldn't use it everyday though, tad pricey.",
product_rating: 4,
)

pro_rev_3 = ProductReview.create!(
user: user_3,
product: product_25,
title: "YASSSS DIS SOME GOOD SHIT!!!!",
content: "Goopgenes is da bomb! Left my face feeling amazingly refreshed, and best of all, NO REACTION! Coeliac tested and approved!",
product_rating: 5,
)

pro_rev_4 = ProductReview.create!(
user: user_2,
product: product_25,
title: "Not my first choice, but a very close second",
content: "A beautiful mix that left my skin feeling moisturized, firm and even-toned. As an all in one solution for someone on a budget, you can't go wrong with this! ",
product_rating: 4,
)
ingredient_1 = Ingredient.find(250)
ingredient_2 = Ingredient.find(965)
ingredient_3 = Ingredient.find(583)

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
ingredient: ingredient_2,
title: "Antioxidant, Moisturizer and Soothener",
content: "Yeast extract is a mixture of flavonoids, sugars, vitamins, and amino acids. This unique derivative of fungi also contains a high concentration of antioxidants, which are capable of neutralizing harmful free-radicals that are present in the environment. The protective mechanism not only helps to maintain the skin’s overall quality and appearance but also allows additional skin care advantages such as increased moisturizing and soothing properties. However, skincare companies do not have to divulge the source of their yeast extract, so coeliacs should keep that in mind.",
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
