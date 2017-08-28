class AddDetailsToContractOwnershipPeriod < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to(:contract_ownership_periods, :contract, index: true, foreign_key: true)
    add_belongs_to(:contract_ownership_periods, :owner, index: true, foreign_key: true)
    add_column :contract_ownership_periods, :start_week, :time
    add_column :contract_ownership_periods, :end_week, :time
  end
end
