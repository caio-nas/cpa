# frozen_string_literal: true
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
    stripe_chkt = purchase.create_checkout(data, 1)
    # close payment_intent
    #puts stripe_chkt.payment_intent
    #purchase = CPA::Controller::Purchase.new
    #purchase.webhook({id: stripe_chkt.payment_intent}, '--')
    puts stripe_chkt

    expect(stripe_chkt.url).not_to be nil
  end

  it "controller list" do
    purchase = CPA::Controller::Purchase.new    
    expect(2).to eq(purchase.products_list.data.length())
  end
 
end