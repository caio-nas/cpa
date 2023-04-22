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
                customer = CPA::DB::Customer.new
                customer.name = user.name
                customer.user_id = user.id
                customer.payment_intent = checkout.payment_intent
                customer.payment_status = checkout.payment_status
                customer.save
            end
            
            def webhook(payload, http_stripe_signature)
                event = CPA::StripeWrapper::Webhook.verify_event_type(payload, http_stripe_signature)
                 # Handle the event
                case event.type
                when 'payment_intent.succeeded'
                  payment_intent = event.data.object # contains a Stripe::PaymentIntent
                  customer = CPA::DB::Customer.find_by(payment_intent: payment_intent['id'])
                  customer.payment_status = 'paid'
                  customer.save
                else
                  puts "Unhandled event type: #{event.type}"
                end

            end
        end
    end
end