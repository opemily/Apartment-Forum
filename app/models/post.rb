class Post < ActiveRecord::Base

  belongs_to(:topic)
  belongs_to(:user)
  has_many(:replies, dependent: :destroy)

  validates(:title, presence: {message: 'Post must have a title'}, length: {within: 0..50, too_long: "Title\'s are limited to %{count} characters. Put it in the body!"})

  validates(:body, presence: {message: 'You cannot post a blank message'})
end
