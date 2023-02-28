require 'spec_helper'
require 'run_service'
require 'extract_products_service'
require 'external_service'
require 'json'

describe RunService do
  let(:external_service) { double(ExternalService) }
  let(:products) { [{id: 1, title: 'Lorem', description: 'Lorem Ipsum' }] }

  it 'extracts all products and batch them to the ExternalService class' do
    expect(ExtractProductsService).to receive(:run).and_return(products)
    expect(ExternalService).to receive(:new).and_return(external_service)
    expect(products).to receive(:each_slice).with(described_class::BATCH_SIZE).and_call_original
    expect(external_service).to receive(:call).with(products.to_json)

    described_class.run
  end
end
