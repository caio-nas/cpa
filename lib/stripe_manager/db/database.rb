# frozen_string_literal: true

module StripeManager
  # --
  # --
  # --
  class Database
    def self.init_config
      ActiveRecord::Base.establish_connection(StripeManager.database_config)
    end
  end
end
