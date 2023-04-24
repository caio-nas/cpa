# frozen_string_literal: true
require 'cpa/helpers/controller'
require 'cpa/stripe_wrapper/products'
require 'cpa/stripe_wrapper/checkout'
require 'cpa/stripe_wrapper/webhook'
require 'cpa/db/session'

module CPA
    module Controller
        class Purchase < CPA::BaseController
            def products_list
                CPA::StripeWrapper::Products.list
            end
            def get_product(id)
                CPA::StripeWrapper::Products.retrieve(id)
            end

            def create_checkout(data, user_id)
                checkout = CPA::StripeWrapper::Checkout.create(data)
                session = CPA::DB::Session.new
                session.user_id = user_id 
                session.payment_intent = checkout.payment_intent
                session.payment_status = checkout.payment_status
                session.save

                checkout
            end
            
            def webhook(payload, http_stripe_signature)
                event = CPA::StripeWrapper::Webhook.create_event_payload(payload, http_stripe_signature)
                 # Handle the event
                case event.type
                when 'payment_intent.succeeded'
                  payment_intent = event.data.object # contains a Stripe::PaymentIntent
                  session = CPA::DB::Session.find_by(payment_intent: payment_intent['id'])
                  session.payment_status = 'paid'
                  session.save
                else
                  puts "Unhandled event type: #{event.type}"
                end
            end
        end
    end
end