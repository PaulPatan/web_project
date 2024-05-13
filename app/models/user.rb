class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       enum role: { normal_user: 0, admin: 1 }

      after_initialize :set_default_role, if: :new_record?

      def set_default_role
        self.role ||= 0  # Default to normal user
      end
         has_many :posts
         has_many :subreddits
         has_many :memberships
         has_many :votes

end
