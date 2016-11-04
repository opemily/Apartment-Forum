class CreateReplyHierarchies < ActiveRecord::Migration
  def change
    create_table :reply_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :reply_hierarchies, [:ancestor_id, :descendant_id, :generations], unique: true, name: 'comment_anc_desc_udx'

    add_index :reply_hierarchies, [:decendant_id], name: 'comment_desc_idx'
  end
end
