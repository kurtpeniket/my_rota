class Rota < ApplicationRecord
  has_many :meetings
  has_one_attached :attachment
end
