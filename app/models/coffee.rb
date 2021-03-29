class Coffee < ApplicationRecord
  validates :blend_name, presence: true
  validates :origin, presence: true
  validates :notes, presence: true
  scope :search, -> (blend_name) { where("LOWER(blend_name) like ?", "%"+ "#{blend_name.downcase}" + "%")}
end
