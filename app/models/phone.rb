class Phone < ApplicationRecord
  belongs_to :guest

  validates_presence_of :phone_number

  def self.create_or_skip_from_params(guest, params, payload_type)
    case payload_type
    when 1 
      self.create_from_first_params(guest, params)
    when 2
      self.create_from_second_params(guest, params)
    end
  end

  def self.create_from_first_params(guest, params)
    phone = params[:guest][:phone]
    guest.phones.create(phone_number: phone) if Phone.find_by_phone_number(phone).nil?
  end

  def self.create_from_second_params(guest, params)
    params[:reservation][:guest_phone_numbers].each do |phone|
      guest.phones.create(phone_number: phone) if Phone.find_by_phone_number(phone).nil?
    end
  end
end
