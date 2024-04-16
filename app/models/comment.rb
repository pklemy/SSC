class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :employee
  
  validates :text, presence: true
end
