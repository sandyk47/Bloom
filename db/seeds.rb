require "open-uri"
require 'faker'

 FAKE_ARTICLES = [
  "Schneider, Günther et al (2005). 'Skin Cosmetics' in Ullmann's Encyclopedia of Industrial Chemistry, Wiley-VCH, Weinheim. doi:10.1002/14356007.a24_219",
 "Cosmetics and Your Health – FAQs. Womenshealth.gov. November 2004. Archived from the original on 2013-03-12.",
 "Cosmetics Overview. U.S. Food & Drug Administration. Retrieved 30 March 2019.",
 "Liddell, Henry George and Scott, Robert. κόσμος in A Greek-English Lexicon",
 "Johnson, Rita (1999). 'What's That Stuff? Lipstick'. Chemical and Engineering News. 77 (28): 31. doi:10.1021/cen-v077n028.p031.",
 "Sindya N. Bhanoo (18 January 2010). 'Ancient Egypt's Toxic Makeup Fought Infection, Researchers Say'. The New York Times.",
 "Schaffer, Sarah (2006), Reading Our Lips: The History of Lipstick Regulation in Western Seats of Power, Digital Access to Scholarship at Harvard, retrieved 2014-06-05",
 "The History of Lipstick And It's Slightly Gross Origins. InventorSpot. Retrieved 2010-02-09.",
 "Williams, Yona . Ancient Indus Valley: Food, Clothing & Transportation. unexplainable.net",
"Adkins, Lesley and Adkins, Roy A. (1998) Handbook to life in Ancient Greece, Oxford University Press",
"Burlando, Bruno; Verotta, Luisella; Cornara, Laura and Bottini-Massa, Elisa (2010) Herbal Principles in Cosmetics, CRC Press",
 "Angeloglou, Maggie. The History of Make-up. First ed. Great Britain: The Macmillan Company, 1970. 41–42. Print.",
 "Pallingston, J (1998). Lipstick: A Celebration of the World's Favorite Cosmetic. St. Martin's Press. ISBN 978-0-312-19914-2.",
 "Dow, Bonnie J. (Spring 2003). 'Feminism, Miss America, and Media Mythology'. Rhetoric & Public Affairs. 6 (1): 127–149. doi:10.1353/rap.2003.0028.",
 "Duffett, Judith (October 1968). WLM vs. Miss America. Voice of the Women's Liberation Movement. p. 4.",
 "Webster, Emma Sarran. 'This Is the Real Difference Between Natural and Synthetic Makeup Brushes'. Teen Vogue. Retrieved 2018-05-07.",
 "Kessler R. More than Cosmetic Changes: Taking Stock of Personal Care Product Safety. Environ Health Perspect; DOI:10.1289/ehp.123-A120 [1]",
 "FDA. Cosmetics: Guidance & Regulation; Laws & Regulations. Prohibited & Restricted Ingredients. [website]. U.S. Food and Drug Administration, Silver Spring, MD. Updated 26 January 2015. [2]",
 "Singer, Natasha (2007-11-01). 'Natural, Organic Beauty'. The New York Times.",
 "'The Lowdown on Mineral Makeup'. WebMD. p. 2. Retrieved 29 October 2018.",
 "Administration, Australian Government Department of Health. Therapeutic Goods (2017-01-11). 'Literature review on the safety of titanium dioxide and zinc oxide nanoparticles in sunscreens'. Therapeutic Goods Administration (TGA). Retrieved 2018-07-17.",
 "Anderson, Heather. 'Ten Benefits of Mineral Makeup (and Why You Should Make Your Own)'.",
 "'Understanding the Cosmetics Regulation'. Cosmetics Europe Association. Retrieved 3 November 2016.",
 "International Organization for Standardization. 'ISO 22715:2006 Cosmetics – Packaging and labelling'. ISO.org. Retrieved 2 November 2016." ]

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
first_name: "Dr. Michelle",
last_name: "Saluja",
age: 32,
password: "password",
verified: true,
gender: "Female",
photo_url: 'https://puu.sh/GUWRs/486c00ed1d.png',
skin_type: "Normal"
)

user_7 = User.create!(
username: "Dr.BertS",
email: "dr.bert.schaider@bloom.com",
first_name: "Dr. Bert",
last_name: "Schaider",
age: 55,
password: "password",
verified: true,
gender: "Male",
photo_url: 'https://puu.sh/GVXkq/d48fbfe6b6.png',
skin_type: "Normal"
)

user_8 = User.create!(
username: "dr.luxian.gan",
email: "dr.luxian.gan@bloom.com",
first_name: "Dr. Lu Xian",
last_name: "Gan",
age: 32,
password: "password",
verified: true,
gender: "Male",
photo_url: 'https://puu.sh/GVXow/0e2d02140c.png',
skin_type: "Normal"
)

user_9 = User.create!(
username: "drxiaolee",
email: "dr.xiao.chuan.lee@bloom.com",
first_name: "Dr. Xiao Chuan",
last_name: "Lee",
age: 37,
password: "password",
verified: true,
gender: "Female",
photo_url: 'https://puu.sh/GVXvL/15f2559d24.png',
skin_type: "Normal"
)

user_10 = User.create!(
username: "drsunilap",
email: "dr.sunila.padmawar@bloom.com",
first_name: "Sunila",
last_name: "Padmawar",
age: 44,
password: "password",
verified: true,
gender: "Female",
photo_url: 'https://puu.sh/GVXz2/7050385cac.png',
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
product_10 = Product.find_by_title("Face Moisturizer")
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
product_25 = Product.find_by_title("GOOPGENES All-In-One Nourishing Face Cream")
product_26 = Product.find(26)
product_27 = Product.find(27)
product_28 = Product.find(28)
product_29 = Product.find(29)
product_30 = Product.find(30)
product_31 = Product.find(31)
product_32 = Product.find(32)
product_33 = Product.find(33)
product_34 = Product.find(34)
product_35 = Product.find_by_title("Pink Drink Firming Resurfacing Essence")

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
users_array = [user_1, user_2, user_3, user_4, user_5, user_6, user_7, user_8, user_9, user_10]

5.times do
  Product.where.not(id:[product_10, product_25, product_35]).each do |product|
    product.product_reviews.create!(
      user: users_array.sample,
      title: Faker::TvShows::Community.quotes,
      content: Faker::TvShows::Simpsons.quote,
      product_rating: rand(1..5),
    )
  end
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
ingredient_1 = Ingredient.find_by_name("Avena Sativa (Oat) Bran Extract")
ingredient_2 = Ingredient.find_by_name("Yeast Ferment (Pink Yeast) Extract")
ingredient_3 = Ingredient.find_by_name("Oryza Sativa (Rice) Bran Extract")

users_verified = [user_4, user_5, user_6, user_7, user_8, user_9, user_10]

5.times do
  Ingredient.where.not(id:[ingredient_1, ingredient_2, ingredient_3]).each do |ingredient|
    ingredient.ingredient_reviews.create!(
      user: users_verified.sample,
      title: Faker::TvShows::Community.quotes,
      content: Faker::TvShows::Simpsons.quote,
      safety_rating: rand(1..10),
      efficacy_rating: rand(1..10),
      supporting_evidence: FAKE_ARTICLES.sample,
    )
  end
end

ing_rev_1 = IngredientReview.create!(
user: user_4,
ingredient: ingredient_1,
title: "Good for cleansing skin, however Coeliacs beware",
content: "Avena Sativa (Oat) Bran Extract is good at leaving your skin looking clean and fresh! It's super gentle too, love it to bits! However coeliacs be safeeeeeee, this stuff ain't good for you!",
safety_rating: 8,
efficacy_rating: 9,
supporting_evidence: "Journal of Zhejiang University Science B, 2013, issue 2, pages 97-105",
)

ing_rev_2 = IngredientReview.create!(
user: user_5,
ingredient: ingredient_1,
title: "An all around superstar!",
content: "It turns out oats are more than just the breakfast of champions, they also have superstar skin benefits. One of the unique abilities of oat bran extract, also know as avena sativa, is to form a barrier between you and the aggressive environment. Oat bran coats skin, helping to prevent external toxins from being absorbed. With less toxins on your skin, your true glow shines through. Oat bran also helps to combat irritants on the skin that cause eczema, rashes, and more. A wonderful source of antioxidants, oat bran is your daily defense against free radical damage.",
safety_rating: 9,
efficacy_rating: 9,
supporting_evidence: "Kurtz E, Wallo W. Colloidal oatmeal: history, chemistry and clinical properties. J Drugs Dermatol. 2007;6(2):167-170",
)

ing_rev_3 = IngredientReview.create!(
user: user_6,
ingredient: ingredient_1,
title: "Thousands of years of safe use",
content: "Oat bran extract is obtained from oats. Oats are fruits of plant Avena sativa. It is a type of cereal grain, best grown in temperate regions. Its most common use is in the food industry as oatmeal or rolled oats. Its use on skin dates back to 2000 BC in Europe. It also has some medicinal properties.",
safety_rating: 10,
efficacy_rating: 10,
supporting_evidence: "NLM (National Library of Medicine). 2012. PubMed online scientific bibliography data",
)

ing_rev_4 = IngredientReview.create!(
user: user_9,
ingredient: ingredient_1,
title: "Long history of excellent safety records",
content: "Oatmeal is a natural product which has an excellent safety record and a long history in the treatment of dermatologic disorders. Oatmeal possesses antioxidant and anti-inflammatory properties. Colloidal oatmeal produced by finely grinding the oat and boiling it to extract the colloidal material and became available in 1945. It is noteworthy that many clinical properties of colloidal oatmeal result from its chemical polymorphism. Oatmeal possesses different types of phenols which exert the antioxidant and anti-inflammatory activity. Avenanthramides are phenolic compounds present in oats and they are responsible for the potent anti-inflammatory effect of oatmeal that appears to mediate the anti-irritant effects of oats.",
safety_rating: 10,
efficacy_rating: 9,
supporting_evidence: "Pazyar N, Yaghoobi R, Kazerouni A, Feily A. Oatmeal in dermatology: a brief review. Indian J Dermatol Venereol Leprol. 2012;78(2):142-145",
)

ing_rev_5 = IngredientReview.create!(
user: user_10,
ingredient: ingredient_2,
title: "Antioxidant, Moisturizer and Soothener",
content: "Yeast extract is a mixture of flavonoids, sugars, vitamins, and amino acids. This unique derivative of fungi also contains a high concentration of antioxidants, which are capable of neutralizing harmful free-radicals that are present in the environment. The protective mechanism not only helps to maintain the skin’s overall quality and appearance but also allows additional skin care advantages such as increased moisturizing and soothing properties. However, skincare companies do not have to divulge the source of their yeast extract, so coeliacs should keep that in mind.",
safety_rating: 6,
efficacy_rating: 10,
supporting_evidence: "Lods, L. M. et al. The future of enzymes in cosmetics. International journal of cosmetic science 22.2, 85-94 (2000)",
)

ing_rev_6 = IngredientReview.create!(
user: user_5,
ingredient: ingredient_2,
title: "Fantastic fungi!",
content: "Large group of fungi that ferment sugars; yeast is a source of beta-glucan, which is a good antioxidant. The types of yeast used in cosmetic products are not harmful and in fact likely contribute to creating a healthier-looking skin surface due to their softening and conditioning action.",
safety_rating: 8,
efficacy_rating: 8,
supporting_evidence: "International Journal of Molecular Sciences, September 2015, pages 21,575-21,590
Annals of Surgery, November 1994, pages 601-609",
)

ing_rev_7 = IngredientReview.create!(
user: user_6,
ingredient: ingredient_2,
title: "Good in the kitchen, and on your face",
content: "You probably know yeast from the kitchen where you put it into milk with a little sugar and then after a couple of minutes brownish bubbles form. That is the fungi fermenting the sugar. As for skin care, yeast contains beta-glucan that is a great soothing ingredient and also a mild antioxidant. The yeast extract itself is a silky clear liquid that has some great moisturizing, skin protecting and film-forming properties on the skin.",
safety_rating: 8,
efficacy_rating: 10,
supporting_evidence: "R.Gaspar, F.B.Camargo, Jr.M.D.Gianeti, P.M.B.G.Maia Campos. Evaluation of dermatological effects of cosmetic formulations containing Saccharomyces cerevisiae extract and vitamins",
)

ing_rev_8 = IngredientReview.create!(
user: user_8,
ingredient: ingredient_2,
title: "Relatively untested, but promising results",
content: "The main negative surrounding the use of yeast in skincare is the relative lack of scientific research into its effects. However it is not thought to irritate skin, so its use is unlikely to cause side effects in users, and the anecdotal evidence of its effects is compelling. Skincare brand SK-II was developed in the Seventies after observing that workers in a Japanese sake brewery had remarkably smooth hands due to years of submerging them into fermented yeast through their work. They identified a specific strain of yeast, Pitera, as the source and include it in their products in high concentrations. Yeast is also believed to tighten, brighten and hydrate the skin as well as tackling pigmentation by inhibiting melanin production.",
safety_rating: 7,
efficacy_rating: 8,
supporting_evidence: "K. D. Hyde, A. H. Bahkali & M. A. Moslem. Fungi—an unusual source for cosmetics",
)

ing_rev_9 = IngredientReview.create!(
user: user_5,
ingredient: ingredient_3,
title: "Good source of necessary antioxidants and vitamin E",
content: "Oryza sativa (rice) bran extract is a plant ingredient used in cosmetics to condition and soften skin. It’s also a chelating agent. The bran is the brown outer layer of the rice kernel. It’s a by-product from milling of rice, but don’t take that to mean it’s a throwaway ingredient: rice bran is a rich source of over 100 antioxidant compounds, including vitamin E, ferulic acid, and oryzanol.",
safety_rating: 10,
efficacy_rating: 8,
supporting_evidence: "Critical Reviews in Food Science and Nutrition, November 2017, pages 3,771-3,780",
)

ing_rev_10 = IngredientReview.create!(
user: user_4,
ingredient: ingredient_3,
title: "Conditions and Softens",
content: "Rice bran extract is used to help moisturize and cleanse skin, and also happens to be coeliac friendly! There might be concerns if you have reactions to pesticides though so choose your brand carefully or you gonna get all that bad stuff up in your system.",
safety_rating: 10,
efficacy_rating: 10,
supporting_evidence: "CIR (Cosmetic Ingredient Review). 2006. CIR Compendium, containing abstracts, discussions, and conclusions of CIR cosmetic ingredient safety assessments. Washington DC",
)

ing_rev_11 = IngredientReview.create!(
user: user_10,
ingredient: ingredient_3,
title: "A good source of antioxidants and free radicals",
content: "Oryza sativa (rice) bran extract is a good source of strong antioxidant and free radical scavenger compounds. These compounds can contribute to protecting the skin from damaging action of free radicals that are formed under UV and premature skin aging. Rice bran oil antioxidants have the capability of penetrating the skin and providing antioxidant protection for the epidermis and dermis against free radical attack. Rice bran oil also contains a high proportion of short-chain fatty acids. These are natural emollients and provide good hydration and occlusion for the skin as well as protecting the skin.",
safety_rating: 10,
efficacy_rating: 9,
supporting_evidence: "Chotimarkorn C, Benjakul S, Silalai N. Antioxidant components and properties of five long-grained rice bran extracts from commercial available cultivars in Thailand. Food Chemistry. 2008;111(3):636-641",
)

ing_rev_12 = IngredientReview.create!(
user: user_9,
ingredient: ingredient_3,
title: "Conditions and Softens",
content: "Rice bran oil moisturises with anti-aging nutrients. Also known as rice bran extract, rice bran oil is simply the oil extracted from the germ and inner husk of rice. It’s similar to peanut oil, with high percentages of fatty acids, which is why it makes it a perfect skin moisturiser. The main benefit of rice bran oil to the skin is its wonderful deep-moisturizing capability and fabulous natural emollients. This is due to its combination of antioxidants, vitamin B and E and fatty acids, which go deep into skin to hydrate. With all its natural components, rice bran oil is considered an anti-aging secret in Japan. It’s actually a high compliment to tell a Japanese woman that she is a “rice bran beauty.” The natural vitamin E plus vitamin B help firm and tighten your look, maintaining hydration, which helps to reduce the appearance of fine lines and wrinkles.",
safety_rating: 10,
efficacy_rating: 10,
supporting_evidence: "Gopala Kriskna K, Hemakumar S, Khatoon S. Study on the composition of rice bran oil and its higher free fatty acids value. American Journal of  Oil Chemists’ Society. 2006;83(2):117-120",
)

puts "Seeding done!!!"
