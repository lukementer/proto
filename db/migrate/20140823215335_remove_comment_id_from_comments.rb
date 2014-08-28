class RemoveCommentIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comment_id, :string
  end
end
