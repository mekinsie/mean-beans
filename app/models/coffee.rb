class Coffee < ApplicationRecord
  validates :blend_name, presence: true
  validates :origin, presence: true
  validates :notes, presence: true
end
