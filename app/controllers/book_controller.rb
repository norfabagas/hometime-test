class BookController < ApplicationController

  before_action :verify_request_header

  def book
    @messages = nil
    payload = 0

    if !first_guest_params.empty? && !first_reservation_params.empty?
      payload = 1
    elsif !second_guest_params.empty? && !second_reservation_params.empty?
      payload = 2
    else
      payload = 0
      @messages = "Need to provide a complete json request"
    end

    @guest = Guest.find_or_new_from_params(params, payload)
    @guest.build_from_params(params, payload)

    if @guest.id.nil?
      if @guest.valid?
        @guest.save
      else
        @messages = @guest.errors.messages.first
        render_http_status 400
        return
      end
    end

    Phone.create_or_skip_from_params(@guest, params, payload)

    @reservation = Reservation.find_or_new_from_params(@guest, params, payload)
    @reservation.build_from_params(@guest, params, payload)

    if @reservation.id.nil?
      if @reservation.valid?
        @reservation.save
      else
        @messages = @reservation.errors.messages.first
        render_http_status 400
        return
      end
    end

    render_http_status 200
  end

  private

  def first_reservation_params
    params.require(:book)
    .permit(
      :reservation_code, 
      :start_date, 
      :end_date,
      :nights,
      :guests,
      :adults,
      :children,
      :infants,
      :status,
      :guest,
      :currency,
      :payout_price,
      :security_price,
      :total_price
    )
  end

  def first_guest_params
    params.require(:book)
    .permit(
      guest: [:first_name, :last_name, :phone, :email]
    )
  end

  def second_reservation_params
    params.require(:book)
    .permit(
      reservation: [
        :code,
        :start_date,
        :end_date,
        :expected_payout_amount,
        :listing_security_price_accurate,
        :host_currency,
        :nights,
        :number_of_guests,
        :status_type,
        :total_paid_amount_accurate,
        guest_details: [
          :localized_description,
          :number_of_adults,
          :number_of_children,
          :number_of_infants
        ],
      ]
    )
  end

  def second_guest_params
    params.require(:book)
    .permit(
      reservation: [
        :guest_email,
        :guest_first_name,
        :guest_last_name,
        # :guest_phone_numbers
      ]
    )
  end

end
