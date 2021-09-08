class Reservation < ApplicationRecord
  belongs_to :guest

  validates_presence_of :reservation_code,
                        :start_date,
                        :end_date,
                        :nights,
                        :guests_total,
                        :guests_adults,
                        :guests_children,
                        :guests_infants,
                        :status,
                        :currency,
                        :security_price,
                        :payout_price,
                        :total_price

  validates :reservation_code, uniqueness: true

  def self.find_or_new_from_params(guest, params, payload_type)
    reservation_code = nil
    case payload_type
    when 1
      reservation_code = params[:reservation_code]
    when 2
      reservation_code = params[:reservation][:code]
    end

    return self.find_or_initialize_by(reservation_code: reservation_code, guest_id: guest.id)
  end

  def build_from_params(guest, params, payload_type)
    case payload_type
    when 1 
      new_from_first_params(guest, params)
    when 2
      new_from_second_params(guest, params)
    end
  end

  private

  def new_from_first_params(guest, params)
    self.start_date = Date.parse(params[:start_date])
    self.end_date = Date.parse(params[:end_date])
    self.nights = params[:nights].to_i
    self.guests_total = params[:guests].to_i
    self.guests_adults = params[:adults].to_i
    self.guests_children = params[:children].to_i
    self.guests_infants = params[:infants].to_i
    self.status = params[:status]
    self.currency = params[:currency]
    self.security_price = params[:security_price]
    self.payout_price = params[:payout_price]
    self.total_price = params[:total_price]
  end

  def new_from_second_params(guest, params)
    self.start_date = Date.parse(params[:reservation][:start_date])
    self.end_date = Date.parse(params[:reservation][:end_date])
    self.nights = params[:reservation][:nights].to_i
    self.guests_total = params[:reservation][:number_of_guests].to_i
    self.guests_adults = params[:reservation][:guest_details][:number_of_adults].to_i
    self.guests_children = params[:reservation][:guest_details][:number_of_children].to_i
    self.guests_infants = params[:reservation][:guest_details][:number_of_infants].to_i
    self.status = params[:reservation][:status_type]
    self.currency = params[:reservation][:host_currency]
    self.security_price = params[:reservation][:listing_security_price_accurate]
    self.payout_price = params[:reservation][:expected_payout_amount]
    self.total_price = params[:reservation][:total_paid_amount_accurate]
  end
end
