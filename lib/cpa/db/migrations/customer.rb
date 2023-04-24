require 'active_record'



class CreateCustomerTable < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |table|
      table.string :name
      table.string :email
      table.timestamps
    end
  end

end

class CPATableCustomer
  def self.set_config(config)
    ActiveRecord::Base.establish_connection(config)
    #adapter: 'sqlite3', database: 'test.db'
  end
  # Create the table
  def self.table_up
    CreateCustomerTable.migrate(:up)
  end

  def self.table_down
    CreateCustomerTable.migrate(:down)
  end
end