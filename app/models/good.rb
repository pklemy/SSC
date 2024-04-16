class Good < ApplicationRecord
  belongs_to :employee
  belongs_to :post
  
  validates :employee_id, uniqueness: {scope: :post_id}
end
