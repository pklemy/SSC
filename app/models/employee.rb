class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  scope :owners, -> { includes(:stores).where.not('stores.employee_id': nil) }
  has_many :stores
  has_many :posts
  def store
    stores.first
  end
end
