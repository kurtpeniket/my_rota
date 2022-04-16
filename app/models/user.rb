class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_role_congregations, dependent: :destroy
  has_many :roles, through: :user_role_congregations
  has_many :congregations, through: :user_role_congregations

end
