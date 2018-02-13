class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :last_name
      t.string :string
      t.string :email
      t.string :password
    end
  end
end
