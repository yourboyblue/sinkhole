class CreateContractOwnershipPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :contract_ownership_periods do |t|

      t.timestamps
    end
  end
end
