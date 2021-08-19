class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :overview, presence: true
end



# Movie
#   has a title and an overview
#   title is unique (FAILED - 14)
#   title cannot be blank (FAILED - 15)
#   overview cannot be blank (FAILED - 16)
#   has many bookmarks (FAILED - 17)
#   should not be able to destroy self if has bookmarks children (FAILED - 18)
