
require 'rails_helper'

RSpec.describe Prospect, type: :model do
  describe "creation" do
    let(:prospect) { FactoryBot.create(:prospect) }

    it "can be created" do
      expect(prospect).to be_valid
    end
  end

  describe "validations" do
    let(:prospect) { FactoryBot.create(:prospect) }

    it 'should have a name' do
      prospect.name = nil
      expect(prospect).to_not be_valid
    end

    it 'cannot have name longer than 100 characters' do
      prospect.name = 'A' * 101
      expect(prospect).to_not be_valid
    end
  end
end