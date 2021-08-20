class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :movies, through: :bookmarks
  has_one_attached :photo
end


# List
#   has a name (FAILED - 8)
#   name cannot be blank (FAILED - 9)
#   name is unique (FAILED - 10)
#   has many bookmarks (FAILED - 11)
#   has many movies (FAILED - 12)
#   should destroy child saved movies when destroying self (FAILED - 13)
