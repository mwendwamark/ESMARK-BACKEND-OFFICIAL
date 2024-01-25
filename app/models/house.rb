# app/models/house.rb

class House < ApplicationRecord
  validates :house_type, inclusion: { in: ["one bedroom", "bedsitter"].map(&:downcase), message: "Invalid house type. Please choose either 'One bedroom' or 'Bedsitter'" }
  validates :house_number, inclusion: { in: ["G1", "G2", "G3", "G4", "G5", "G6", "G7", "A1", "A2", "A3", "A4", "A5", "B1", "B2", "B3", "B4", "B5", "C1", "C2", "C3", "C4", "C5"], message: "Invalid house number. Please choose a valid house number" }
  validates :floor, inclusion: { in: ["ground", "first", "second", "third"].map(&:downcase), message: "Invalid floor. Please choose either 'Ground', 'First', 'Second', or 'Third'" }
  validates :price, :image_url_1, :image_url_2, :image_url_3, :image_url_4, :image_url_5, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 5000, less_than_or_equal_to: 15000, message: "must be between KES.5000 and KES.15000", only_integer: false }
  validates :house_number, uniqueness: true
end
