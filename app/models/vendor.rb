class Vendor < ApplicationRecord
  belongs_to :store
  #has_many :pos
  
  validates :vendor_name, presence: true
  validates :name, presence: true
  validates :url, presence: true
  validates :phone, presence: true

end
