class Role < ApplicationRecord
  has_many :user_role_congregations, dependent: :destroy
  has_many :users, through: :user_role_congregations
  has_many :congregations, through: :user_role_congregations

  validates :name, presence: true
end
