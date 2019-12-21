class User < ApplicationRecord
  before_destroy :least_one
  has_many :tasks
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  private
  def least_one
    if self.admin? && User.all.where(admin: "true").count == 1
      throw :abort
    end
  end
end