class EmployeeStore < ApplicationRecord
  belongs_to :employee
  belongs_to :store
end
