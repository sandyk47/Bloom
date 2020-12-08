namespace :load_csv do
  desc "TODO"
  task products: :environment do
    CSV.foreach "db/support/mecca_scraper.csv", headers: true, header_converters: :symbol do |row|
      brand = Brand.where(name: row[:brand]).first_or_create!
      @product = Product.where(title: row[:product], brand_id: brand.id).first_or_create!
      @product.update(benefits: row[:benefits], oneliner: row[:oneliner], img: row[:img], category: row[:category], sub_category: row[:sub_category], description: row[:description])
      puts "Product Created #{@product.title}"
      ingredients = row[:ingredients].scan(/([^()\s]+?(?:(?:\([^()]+?\))?[^()]*?)*)[,\n]/).flatten
      ingredients.each do |ingredient|
        new_ingredient = Ingredient.where(name: ingredient.titlecase).first_or_create!
        ProductIngredient.create!(product_id: @product.id, ingredient_id: new_ingredient.id)
      end
    end
  end

end
