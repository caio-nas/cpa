# frozen_string_literal: true

require "stripe_manager"

StripeManager.setStripeKey("sk_test_51MoRlvHYLHKZTvhNH4PMOcCqU2XskC83pqeAoXh6yuLBAfLiTGjl9qwpPs0uvzFhp8ZzGouxuy1WWrGHaB4YQ2cJ002RNeTBmE")
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
