require 'open-uri'
require 'nokogiri'
require 'pry-byebug'

module Scraper
  class MeccaProducts
    def initialize
    end

    def call
      results = get_urls.map do |url|
        get_product_info(url)
      binding.pry
      end

      results.each do |result|
        Brand.create(name: result[:brand])
      end

      results[:ingredients].each do |result|
        Ingredient.create(name: result[index])
      end

      results.each do |result|
        Product.create(name: result[:product])
        Product.create(benefits: result[:benefits])
        Product.create(oneliner: result[:oneliner])
        Product.create(img: result[:img])
        Product.create(description: result[:description])
        Product.create(category: result[:category])
        Product.create(sub_category: result[:sub_category])
      end    
    end
    
    private
    
    def get_urls
      html_file = open('https://www.mecca.com.au/skin-care/#start=36&sz=36').read
      sleep(15.seconds)
      html_doc = Nokogiri::HTML(html_file)
      category_elements = html_doc.search('.grid-product')
      urls = category_elements.map do |card|
        card.search('.product-image > a').first.attributes["href"].value
      end
    end
    
    def get_product_info(url)
      
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      product_details = html_doc.search('.css-1piegy2-productInfoContainer')
      product_details.each do |element|
        
        brand = element.search('header > a').inner_text
        product = element.search('header > h2').inner_text
        price = element.search('.css-12nhxov-paragraph-sansSerif-currentPriceLabel').inner_text
        benefits = element.search('.css-12pgov5-benefitLabel').inner_text
        oneliner = element.search('.css-wlia4n-size5-serifDisplay-oneLiner').inner_text
        img = element.search('img').first["src"]
        
        html_doc.search('.accordion-content').each do |element_2|
          is_element = element_2["data-testid"] == "Ingredients-accordion-content"
          if is_element 
            @ingredients_array = element_2.search("div div").inner_text.split(',')
          end
          
        end
        
        body_string = html_doc.search('.accordion-inner-content')
        body_no_p = body_string.search("//div/text()[preceding-sibling::br]").first
        body_with_p = body_string.search("//div/p/text()[preceding-sibling::strong]").first
        if body_no_p.to_s.length > body_with_p.to_s.length then description = body_no_p.inner_text
        else description = body_with_p.to_s
        end
        
        category_class = html_doc.search(".css-134gzjg-breadcrumbsList-isVisibleDesktop")
        category = category_class.search("li:nth-child(4)").inner_text
        sub_category_class = html_doc.search(".css-134gzjg-breadcrumbsList-isVisibleDesktop")
        sub_category = category_class.search("li:nth-child(5)").inner_text
        
        @product = {brand: brand, product: product, price: price, benefits: benefits, oneliner: oneliner, img: img, ingredients: @ingredients_array, description: description, category: category, sub_category: sub_category}
      end
      return @product
    end
  end
end