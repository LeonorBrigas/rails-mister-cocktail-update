class Cocktail < ApplicationRecord
  # When you delete a cocktail, you should delete associated doses
  # :dependent => :destroy
  has_many :doses, :dependent => :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true

  validates :photo, presence: true
end
