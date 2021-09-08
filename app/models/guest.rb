class Guest < ApplicationRecord
  has_many :reservations
  has_many :phones

  attr_accessor :phone_number

  after_initialize do
    self.phone_number = "self.phones.pluck(:phone_number)"
  end

  validates_presence_of :email,
                        :first_name,
                        :last_name

  validates :email, uniqueness: true

  def self.find_or_new_from_params(params, payload_type)
    email = nil
    case payload_type
    when 1
      email = params[:guest][:email]
    when 2
      email = params[:reservation][:guest_email]      
    end

    return self.find_or_initialize_by(email: email)
  end

  def build_from_params(params, payload_type)
    case payload_type
    when 1
      build_from_first_params(params)
    when 2
      build_from_second_params(params)
    else  
      nil
    end
  end

  private

  def build_from_first_params(params)
    self.first_name = params[:guest][:first_name]
    self.last_name = params[:guest][:last_name]
  end
    
  def build_from_second_params(params)
    self.first_name = params[:reservation][:guest_first_name]
    self.last_name = params[:reservation][:guest_last_name]
  end

end
