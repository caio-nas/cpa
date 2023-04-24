# frozen_string_literal: true
require 'cpa/helpers/controller'
require 'cpa/stripe_wrapper/products_wrapper'
require 'cpa/stripe_wrapper/checkout_wrapper'
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
                session.checkout_id = checkout.id
                session.payment_status = checkout.payment_status
                session.save

                checkout
            end
            
            def webhook(payload, http_stripe_signature)
                event = CPA::StripeWrapper::Webhook.create_event_payload(payload, http_stripe_signature)
                 # Handle the event
                case event.type
                when 'checkout.session.completed'
                  checkout_session = event.data.object # contains a Stripe::PaymentIntent
                  session = CPA::DB::Session.find_by(checkout_id: checkout_session['id'])
                  if session != nil
                    session.payment_status = checkout_session['payment_status']
                    session.save
                  end
                else
                  puts "Unhandled event type: #{event.type}"
                end
            end
        end
    end
end