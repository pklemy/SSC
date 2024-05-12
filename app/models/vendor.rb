class Vendor < ApplicationRecord
  belongs_to :store
  
  validates :vendor_name, presence: true
  validates :name, presence: true
  validates :url, presence: true
  validates :phone, presence: true

end
