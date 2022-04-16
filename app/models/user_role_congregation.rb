class UserRoleCongregation < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :congregation
end
