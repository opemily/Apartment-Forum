class ChangeReplyIdToParentId < ActiveRecord::Migration
  def change
    rename_column(:replies, :reply_id, :parent_id)
  end
end
