require 'active_record'



class CreateSessionTable < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |table|
      table.integer :user_id
      table.string :checkout_id
      table.string :payment_status
      table.timestamps
    end
  end

end

class CPATableSession
  def self.set_config(config)
    ActiveRecord::Base.establish_connection(config)
    #adapter: 'sqlite3', database: 'test.db'
  end
  # Create the table
  def self.table_up
    CreateSessionTable.migrate(:up)
  end

  def self.table_down
    CreateSessionTable.migrate(:down)
  end
end