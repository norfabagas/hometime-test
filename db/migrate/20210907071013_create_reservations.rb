class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.belongs_to  :guest, foreign_key: true
      t.string      :reservation_code, null: false, default: ""
      t.date        :start_date
      t.date        :end_date
      t.integer     :nights
      t.integer     :guests_total
      t.integer     :guests_adults
      t.integer     :guests_children
      t.integer     :guests_infants
      t.string      :status
      t.string      :currency
      t.float       :security_price
      t.float       :payout_price
      t.float       :total_price
      t.timestamps
    end
  end
end
