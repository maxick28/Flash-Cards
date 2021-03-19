class Collection < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :cards, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likers, through: :reviews, source: :user
end
