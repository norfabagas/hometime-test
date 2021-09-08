class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :email,      null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :last_name,  null: false, default: ""
      t.timestamps
    end

    add_index :guests, :email, unique: true
  end
end
