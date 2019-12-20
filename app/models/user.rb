class User < ApplicationRecord
    before_destroy :least_one
    before_update :check_admin
    has_many :task
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
    def count_admin
      @count_admin = User.where(admin: true).length
    end
    def check_admin
      count_admin
      if @count_admin == 1 && admin == false
        redirect_to admin_users_path
      else
      end
    end
end
