class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :session_token
      t.string :activation_token
      t.string :password

      t.timestamps
    end
  end
end
