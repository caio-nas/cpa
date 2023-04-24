# frozen_string_literal: true

require 'json'

module CPA
    module StripeWrapper
      # Stripe Webhook
      class Webhook
        # Module 
        def self.create_event_payload(payload, http_stripe_signature)
            event = nil
            begin
                event = Stripe::Event.construct_from(
                  JSON.parse(payload, symbolize_names: true)
                )
            rescue JSON::ParserError => e
                # Invalid payload
                puts " Webhook error while parsing basic request. #{e.message}"
                return
            end
             # Check if webhook signing is configured.
            if CPA.endpoint_secret
              # Retrieve the event by verifying the signature using the raw body and secret.
              #srequest.env['HTTP_STRIPE_SIGNATURE'];
              begin
                event = Stripe::Webhook.construct_event(
                  payload, http_stripe_signature, CPA.endpoint_secret
                )
              rescue Stripe::SignatureVerificationError => e
                puts "⚠️  Webhook signature verification failed. #{e.message}"
              end
            end

            event
        end
      end
    end
end