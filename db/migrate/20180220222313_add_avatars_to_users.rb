class AddAvatarsToUsers < ActiveRecord::Migration[5.1]
  def up
    add_attachment :users, :avatar
  end

  def down
    drop_attached_file :users, :avatar
  end
end
