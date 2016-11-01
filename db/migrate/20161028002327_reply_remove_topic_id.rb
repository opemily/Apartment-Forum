class ReplyRemoveTopicId < ActiveRecord::Migration
  def change
    remove_column(:replies, :topic_id)
  end
end
