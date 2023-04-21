# frozen_string_literal: true
require 'cpa/helpers/controller'
require 'cpa/stripe_wrapper/products'
require 'cpa/stripe_wrapper/checkout'

module CPA
    module Controller
        class Purchase < CPA::BaseController
            def products_list
                CPA::StripeWrapper::Products.list
            end
            def get_product(id)
                CPA::StripeWrapper::Products.retrieve(id)
            end

            def create_checkout(data)
                CPA::StripeWrapper::Checkout.create(data)
            end
        end
    end
end