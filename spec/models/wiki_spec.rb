require 'rails_helper'

RSpec.describe Wiki, type: :model do

  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body") }

   describe "attributes" do
     it "has title, body and private attributes" do
       expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body")
     end
   end
end
