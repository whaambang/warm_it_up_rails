require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should belong_to(:posse) }
  it { should have_many(:votes) }

  it 'responds to correct attributes' do
    posse = Posse.create(name: "Knuth")
    user = User.create(uid: "12345", provider: "github", posse_id: posse.id)

    expect(user).to respond_to(:uid)
    expect(user).to respond_to(:provider)
  end

  describe '.from_omniauth' do
    it 'only creates a new user' do
      user = User.create
    end
  end
end
