require 'rails_helper'


RSpec.describe Guest, type: :model do
  subject {
    described_class.new(
      email: 'test@mail.com',
      first_name: 'first_name',
      last_name: 'last_name'
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with non-unique email" do
    subject.save
    expect(described_class.new(
      email: 'test@mail.com',
      first_name: 'first_name',
      last_name: 'last_name'
    )).to_not be_valid
  end
end
