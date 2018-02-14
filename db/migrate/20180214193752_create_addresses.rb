class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :alias
      t.integer :user_id
      t.timestamps
    end
  end
end
