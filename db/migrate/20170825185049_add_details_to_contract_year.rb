class AddDetailsToContractYear < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to(:contract_years, :contract, index: true, foreign_key: true)
    add_belongs_to(:contract_years, :owner, index: true, foreign_key: true)
    add_column :contract_years, :season, :time
    add_column :contract_years, :liability, :decimal
    add_column :contract_years, :liability_type, :integer
  end
end
