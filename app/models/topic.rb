class Topic < ActiveRecord::Base
  
  has_many(:posts, dependent: :destroy)

  validates(:title, presence: {message: 'Topic must have a title'}, uniqueness: true, length: {within: 0..100, too_long: "Title\'s are limited to %{count} characters. Put it in the introduction!"})

  validates(:introduction, presence: {message: 'Topic must have an introduction explaining the subject of the topic'}, uniqueness: true)
end
