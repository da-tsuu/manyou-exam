class User < ApplicationRecord
    before_destroy :check_last_admin 
    has_many :task
    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    private

    def check_last_admin
      throw :abort if self.admin? && User.where(admin: true).size == 1
    end
  
end
