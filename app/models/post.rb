class Post < ApplicationRecord
  belongs_to :follower
  has_many :comments
end
