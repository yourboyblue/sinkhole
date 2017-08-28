class CreateContractYears < ActiveRecord::Migration[5.1]
  def change
    create_table :contract_years do |t|

      t.timestamps
    end
  end
end
