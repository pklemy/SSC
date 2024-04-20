class Post < ApplicationRecord
  belongs_to :employee
  belongs_to :store
  has_many :comments, dependent: :destroy
  
  has_many :goods, dependent: :destroy
  has_many :good_employees, through: :goods, source: :employee
  
  belongs_to :vendor, optional: true
  
  validates :title, presence: true
  validates :body, presence: true
  
  enum genre: { shift: 0, vendor: 1, lost_item: 2 }
  
  before_validation :vendor_check
  
  def good_by?(employee)
    good.exists?(employee_id: employee.id)
  end
  
  private
  
  def vendor_check
    if self.genre != "vendor"
      self.vendor = nil
    else
      if !self.vendor.present?
        errors.add(:vendor, "を選択してください.")
      end
    end
  end
end
