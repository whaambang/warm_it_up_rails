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

  describe "#add_points" do
    it "increases a posse's score by given amount" do
      posse = Posse.create(name: "McCarthy")

      posse.add_points(50)

      expect(posse.scores).to eq(50)
    end
  end

  describe "#remove_points" do
    it "decreases a posse's score by given amount" do
      posse = Posse.create(name: "McCarthy")

      posse.add_points(100)
      posse.remove_points(50)

      expect(posse.scores).to eq(50)
    end
  end
end
