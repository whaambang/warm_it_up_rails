require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should belong_to(:posse) }

  it 'has responds to correct attributes' do
    posse = Posse.create(name: "Knuth")
    user = User.create(uid: "12345", provider: "github", posse_id: posse.id)

    expect(user).to respond_to(:uid)
    expect(user).to respond_to(:provider)
  end
end
