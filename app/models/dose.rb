class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  # description:text
  #cocktail_id
  #ingredient_id
  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: {scope: :ingredient}
end
