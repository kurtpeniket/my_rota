class Congregation < ApplicationRecord
  has_many :user_role_congregations, dependent: :destroy
  has_many :roles, through: :user_role_congregations
  has_many :users, through: :user_role_congregations

  validates :name, presence: true

  scope :active, -> { where(active: true) }

end
