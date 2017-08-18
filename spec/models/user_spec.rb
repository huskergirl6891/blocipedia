require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.create!(email: "user@blocipedia.com", password: "password") }

  describe "attributes" do
    it "should have email attribute" do
      expect(user).to have_attributes(email: user.email)
    end

    # it "responds to role" do
    #   expect(user).to respond_to(:role)
    # end
    #
    # it "responds to admin?" do
    #   expect(user).to respond_to(:admin?)
    # end
    #
    # it "responds to member?" do
    #   expect(user).to respond_to(:member?)
    # end
  end
end
