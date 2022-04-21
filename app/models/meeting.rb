class Meeting < ApplicationRecord
  has_many :congregations, through: :user_meeting_congregations
  belongs_to :rota

end
