
require 'rails_helper'

RSpec.describe Prospect, type: :model do
  describe "creation" do
    let(:prospect) { FactoryBot.create(:prospect) }

    it "can be created" do
      expect(prospect).to be_valid
    end
  end
end