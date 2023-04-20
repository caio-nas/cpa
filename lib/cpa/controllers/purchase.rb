# frozen_string_literal: true
require 'cpa/helpers/controller'
require 'cpa/stripe_wrapper/products'
require 'cpa/stripe_wrapper/checkout'
require 'cpa/stripe_wrapper/webhook'

module CPA
    module Controller
        class Purchase < CPA::BaseController
            def products_list
                CPA::StripeWrapper::Products.list
            end
            def get_product(id)
                CPA::StripeWrapper::Products.retrieve(id)
            end

            def create_checkout(data, user)
                CPA::StripeWrapper::Checkout.create(data)
            end
            
            def webhook(payload, http_stripe_signature)
                event = CPA::StripeWrapper::Webhook.verify_event_type(payload, http_stripe_signature)
                 # Handle the event
                case event.type
                when 'payment_intent.succeeded'
                  payment_intent = event.data.object # contains a Stripe::PaymentIntent
                  puts "Payment for #{payment_intent['amount']} succeeded."
                  puts "-- Evandro test --"
                  # Then define and call a method to handle the successful payment intent.
                  # handle_payment_intent_succeeded(payment_intent)
                when 'payment_method.attached'
                  payment_method = event.data.object # contains a Stripe::PaymentMethod
                  # Then define and call a method to handle the successful attachment of a PaymentMethod.
                  # handle_payment_method_attached(payment_method)
                else
                  puts "Unhandled event type: #{event.type}"
                end

            end
        end
    end
end