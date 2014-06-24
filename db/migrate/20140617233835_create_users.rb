class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :city
      t.string :address
      t.string :password_digest

      t.timestamps
    end
  end
end
