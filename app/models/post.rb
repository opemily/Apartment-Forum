class Post < ActiveRecord::Base
  belongs_to :topic
  has_many :responses
   validates(:title, presence: {message: 'Post must have a title'}, length: {within: 10..100, too_long: "Title\'s are limited to %{count} characters. Put it in the body!"})
  validates(:body, presence: {message: 'You cannot post a blank message'}, uniqueness: true)
end
