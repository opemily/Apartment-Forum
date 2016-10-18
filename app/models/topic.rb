class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates(:title, presence: {message: 'Topic must have a title'}, uniqueness: true, length: {within: 10..100, too_long:too_long: "Title\'s are limited to %{count} characters. Put it in the introduction!"})
  validates(:title, presence: {message: 'Topic must have an introduction explaining what posts go there'}, uniqueness: true, length: {minimum: 10, too_short: "%{count} is the minimum allowed"})
end
