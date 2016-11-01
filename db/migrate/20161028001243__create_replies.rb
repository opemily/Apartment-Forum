class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :topic_id
      t.integer :user_id
      t.integer :reply_id
      t.text :body

      t.timestamps null: false
    end
  end
end
