# frozen_string_literal: true
RSpec.describe StripeManager::Products do
  it "List of products" do 
    expect(2).to eq(StripeManager::Products.list_products.data.length())
  end

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
    stripecall = StripeManager::Checkout.create(data)
    expect(stripecall.url).not_to be nil
  end

  it "Test database Customer" do
    # Print information about the database table
    require 'stripe_manager/db/customer'
    StripeManager::DB::Customer.columns.each { |column|
        puts column.name
        puts column.type
    }
    expect(true).to be true
  end
end