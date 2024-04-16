class Store < ApplicationRecord
  belongs_to :employee
  has_many :vendors, dependent: :destroy
  has_many :employee_stores, dependent: :destroy
  has_many :staff_employees, through: :employee_stores, source: :employee
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  
  before_create :create_hash
  
  private
  
  def create_hash
    stores = Store.all.pluck(:store_hash)
    self.store_hash = SecureRandom.hex(12)
    while stores.include?(self.store_hash)
      self.store_hash = SecureRandom.hex(12)
    end
  end
end
