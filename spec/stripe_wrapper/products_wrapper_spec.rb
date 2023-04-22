# frozen_string_literal: true
require './lib/cpa/controllers/purchase_controller.rb'
RSpec.describe CPA::StripeWrapper::Products  do
  it "making checkout" do
    data = {
        success_url: 'https://example.com/success',
        line_items: [
          {price: 'price_1MoVWIHYLHKZTvhNufrmjjmy', quantity: 2},
          {price: 'price_1MoUYIHYLHKZTvhN1MzxCy7j', quantity: 1},
        ],
        mode: 'subscription',
        client_reference_id: 'cus_NdmYqLRet6FPT0'
    }
    purchase = CPA::Controller::Purchase.new
    stripecall = purchase.create_checkout(data)
    expect(stripecall.url).not_to be nil
  end

  it "controller list" do
    purchase = CPA::Controller::Purchase.new    
    expect(2).to eq(purchase.products_list.data.length())
  end
  
end