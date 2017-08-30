class ContractOwnershipPeriod < ApplicationRecord
  belongs_to :owner
  belongs_to :contract
end

