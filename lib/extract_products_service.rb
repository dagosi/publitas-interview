require 'nokogiri'
require 'json'

class ExtractProductsService
  class << self
    def run
      all_products.map do |product|
        {
          id: product.xpath('./g:id').text,
          title: product.xpath('./title').text,
          description: product.xpath('./description').text
        }
      end
    end

    private

    def all_products
      puts "Parsing XML..."
      all_products ||=
        begin
          nokogiri_xml = File.open(feed_path) { |f| Nokogiri::XML.parse(f) }
          all_products = nokogiri_xml.xpath('//item')
        end
    end

    def feed_path
      File.join(File.dirname(__FILE__), '..', 'feed.xml')
    end
  end
end
