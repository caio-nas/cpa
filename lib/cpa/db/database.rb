# frozen_string_literal: true

module CPA
  # --
  # --
  # --
  class Database
    def self.init_config
      ActiveRecord::Base.establish_connection(CPA.database_config)
    end
  end
end
