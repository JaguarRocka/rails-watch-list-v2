class Movie < ApplicationRecord
  has_many :bookmarks
  # Un film doit avoir un titre unique et un aperçu
  validates :title, uniqueness: true
  validates :overview, presence: true
end
