class Food < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_food, foreign_key: 'food_id'

  validates :name, presence: true, length: { in: 1..20 }
  validates :measurement_unit, presence: true, length: { in: 1..10 }
  validates :unit_price, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
