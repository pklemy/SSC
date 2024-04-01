class Good < ApplicationRecord
  belongs_to :employee
  belongs_to :store
  belongs_to :comment
end
