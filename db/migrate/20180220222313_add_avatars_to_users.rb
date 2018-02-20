class AddAvatarsToUsers < ActiveRecord::Migration[5.1]
  def up
    add_attachment :users, :avatar
    #change_table :users do |t|
    #  t.attachment :avatar
    #end
  end

  def down
    #remove_attachment :users, :avatar
    drop_attached_file :users, :avatar
  end
end
