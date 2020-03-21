class AddUserIdToPost < ActiveRecord::Migration[6.0]
  def up
    add_reference :posts, :user, foreign_key: true
    change_column :posts, :user_id, :integer, null: false
  end

  def down
    remove_reference :posts, :user
  end
end
