class Owner < ApplicationRecord
  has_many: :contract_years
  has_many: :contract_ownership_periods
end
