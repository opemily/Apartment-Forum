class ReplyAddPostId < ActiveRecord::Migration
  def change
    add_column(:replies, :post_id, :integer)
  end
end
