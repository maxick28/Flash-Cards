class Card < ApplicationRecord
  belongs_to :collection
  validates :front, :back, presence: true
  validates :front, uniqueness: true
end
