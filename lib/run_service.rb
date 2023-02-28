require_relative 'extract_products_service'
require_relative 'external_service'

class RunService
  BATCH_SIZE = 14_500

  class << self
    def run
      puts "Extracting all products..."
      all_products_json = ExtractProductsService.run

      puts "Calling external service in batches"
      external_service = ExternalService.new
      all_products_json.each_slice(BATCH_SIZE) do |batch_products|
        external_service.call(batch_products.to_json)
      end
    end
  end
end
