class Post < ApplicationRecord
  belongs_to :employee
  belongs_to :store
  has_many :goods
end
