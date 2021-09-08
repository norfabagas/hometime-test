class ApiPayload

  def initialize(payload)
    @payload = payload
  end

  private

  def first_payload
    return {
      reservation_code: "",
      start_date: "",
      end_date: "",
      nights: 0,
      guests: 0,
      adults: 0,
      children: 0,
      infants: 0,
      status: "",
      guest: {
        first_name: "",
        last_name: "",
        phone: "",
        email: ""
      },
      currency: "",
      payout_price: "",
      security_price: "",
      total_price: ""
    }
  end

  def second_payload
    {
      reservation: {
        code: "",
        start_date: "",
        end_date: "",
        expected_payout_amount: "",
        guest_details: {
        localized_description: "",
        number_of_adults: 0,
        number_of_children: 0,
        number_of_infants: 0
      },
        guest_email: "",
        guest_first_name: "",
        guest_last_name: "",
        guest_phone_numbers: [],
        listing_security_price_accurate: "",
        host_currency: "",
        nights: 0,
        number_of_guests: 0,
        status_type: "",
        total_paid_amount_accurate: ""
      }
    }
  end

  def guest_object
    first = {
      guest: {
        first_name: "",
        last_name: "",
        phone: "",
        email: ""
      }
    }

    second = {
      guest_email: "",
      guest_first_name: "",
      guest_last_name: "",
      guest_phone_numbers: [],
    }
    
    return first
  end

  def reservation_object
    first = {
      reservation_code: "",
      start_date: "",
      end_date: "",
      nights: 0,
      guests: 0,
      adults: 0,
      children: 0,
      infants: 0,
      status: "",
      currency: "",
      payout_price: "",
      security_price: "",
      total_price: ""
    }
    
    second = {
      reservation: {
        code: "",
        start_date: "",
        end_date: "",
        expected_payout_amount: "",
        guest_details: {
          localized_description: "",
          number_of_adults: 0,
          number_of_children: 0,
          number_of_infants: 0
        },
        listing_security_price_accurate: "",
        host_currency: "",
        nights: 0,
        number_of_guests: 0,
        status_type: "",
        total_paid_amount_accurate: ""
      }
    }

    return first
  end
end