class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id}
    has_one_attached :photo
end

# Bookmark
# has a comment (FAILED - 1)
# comment cannot be shorter than 6 characters (FAILED - 2)
# belongs to a movie (FAILED - 3)
# belongs to an list (FAILED - 4)
# movie cannot be blank (FAILED - 5)
# list cannot be blank (FAILED - 6)
# is unique for a given movie/list couple (FAILED - 7)
