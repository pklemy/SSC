class Vendor < ApplicationRecord
  belongs_to :store
  has_many :pos
end
