class Contract < ApplicationRecord
  has_many :contract_seasons
  has_many :contract_ownership_periods
  has_one :contract
end
