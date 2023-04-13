# frozen_string_literal: true
require 'cpa/helpers/controller'
require 'cpa/stripe_wrapper/products'

module CPA
    module Controller
        class Pruchase < CPA::BaseController
            def products_list
                CPA::StripeWrapper::Products.list_products
            end
            def get_product(id)
                CPA::StripeWrapper::Products.get(id)
            end
        end
    end
end