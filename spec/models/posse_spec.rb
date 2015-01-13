require 'rails_helper'

describe "Posse", :type => :model do
  it "is valid" do
    posse = Posse.new(name: "McCarthy")

    expect(posse).to be_valid
  end

  it "is invalid without a name" do
    posse = Posse.new

    expect(posse).not_to be_valid
  end
end
