class Ingredient < ApplicationRecord
    has_many :doses
    #name:string
    validates :name, presence: true, uniqueness: true
end
