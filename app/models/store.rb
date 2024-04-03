class Store < ApplicationRecord
  belongs_to :employee
  has_many :vendors
  has_many :employee_stores
  has_many :staffs, through: :employee_stores, source: :employee
  has_many :posts
end
