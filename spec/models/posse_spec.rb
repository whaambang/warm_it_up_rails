require 'rails_helper'

describe "the posse model" do

  it "is valid with a name" do
    posse = Posse.new
    posse.name = "McCarthy"
    posse.save

    expect(Posse.all.count).to eq(1)
    expect(Posse.first.name).to eq("McCarthy")
  end

  it "is invalid without a name" do
    posse = Posse.create

    expect(Posse.all.count).to eq(0)
  end
end
