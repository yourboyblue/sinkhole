class AddDetailsToContract < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :start_day, :datetime
    add_column :contracts, :end_day, :datetime
    add_column :contracts, :base_salary, :decimal
    add_column :contracts, :bonus, :decimal
    add_column :contracts, :contract_type, :integer
    add_column :contracts, :signing_type, :integer
  end
end
