require 'rails_helper'

RSpec.describe User, type: :model do
  it "it can find a user" do
    user = create(:user)

    expect(user.name).to eq("Andrew Carmer")
    expect(user.email).to eq("email@example.com")
  end
end
