require 'rails_helper'

RSpec.describe Phone, type: :model do
  # Phone.delete_all
  # Guest.delete_all

  Guest.create(
    email: "#{Time.now.to_i}@mail.test", 
    first_name: 'first_name',
    last_name: 'last_name'
  )
  subject {
    described_class.new(
      guest_id: Guest.last.id,
      phone_number: '1234567890'
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without guest_id" do
    subject.guest_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without phone_number" do
    subject.phone_number = nil
    expect(subject).to_not be_valid
  end
end
