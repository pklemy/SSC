class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :rememberable, :database_authenticatable, :registerable, :validatable
         #:recoverable, 
  
  scope :owners, -> { includes(:stores).where.not('stores.employee_id': nil) }
  has_many :stores
  has_many :posts
  
  has_many :employee_stores
  has_many :staff_stores, through: :employee_stores, source: :store
  
  has_many :comments, dependent: :destroy
  
  has_many :goods, dependent: :destroy
  has_many :good_posts, through: :goods, source: :post
  
  def good(post)
    self.goods.find_or_create_by(post_id: post.id)
  end
  
  def ungood(post)
    self.goods.find_by(post_id: post.id)&.destroy
  end
  
  def good?(post)
    self.good_posts.include?(post)
  end
  
  # def store
  #   stores.first
  # end
end
