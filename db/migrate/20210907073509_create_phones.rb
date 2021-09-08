class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.belongs_to :guest, foreign_key: true
      t.string :phone_number
      t.timestamps
    end
  end
end
