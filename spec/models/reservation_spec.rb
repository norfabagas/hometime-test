require 'rails_helper'

RSpec.describe Reservation, type: :model do
  Reservation.delete_all
  Guest.delete_all

  Guest.create(
    email: "#{Time.now.to_i}@mail.test", 
    first_name: 'first_name',
    last_name: 'last_name'
  )
  subject {
    described_class.new(
      guest_id: Guest.last.id,
      reservation_code: 'XXXYYY123',
      start_date: Date.new,
      end_date: Date.new + 1.day,
      nights: 1,
      guests_total: 1,
      guests_adults: 1,
      guests_children: 0,
      guests_infants: 0,
      status: 'accepted',
      currency: 'AUD',
      security_price: '100',
      payout_price: '100',
      total_price: '200'
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without guest_id" do
    subject.guest_id = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without reservation_code" do
    subject.reservation_code = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without start_date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without end_date" do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without nights" do
    subject.nights = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without guests_total" do
    subject.guests_total = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without guests_adults" do
    subject.guests_adults = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without guests_children" do
    subject.guests_children = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without guests_infants" do
    subject.guests_infants = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without status" do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without currency" do
    subject.currency = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without security_price" do
    subject.security_price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without payout_price" do
    subject.payout_price = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without total_price" do
    subject.total_price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with non-unique reservation_code" do
    subject.save
    expect(described_class.new(
      guest_id: Guest.last.id,
      reservation_code: 'XXXYYY123',
      start_date: Date.new,
      end_date: Date.new + 1.day,
      nights: 1,
      guests_total: 1,
      guests_adults: 1,
      guests_children: 0,
      guests_infants: 0,
      status: 'accepted',
      currency: 'AUD',
      security_price: '100',
      payout_price: '100',
      total_price: '200'
    )).to_not be_valid
  end

end
