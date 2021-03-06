
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

    it 'should have an email' do
      prospect.email = nil
      expect(prospect).to_not be_valid
    end

    it 'cannot have an invalid email format' do
      prospect.email = 'ZZYZX'
      expect(prospect).to_not be_valid
    end

    it 'cannot have note longer than 0 characters' do
      prospect.name = 'A' * 1001
      expect(prospect).to_not be_valid
    end

    it "should have a user" do
      prospect.user = nil
      expect(prospect).to_not be_valid
    end
  end

  describe "descending scope for created_at order" do
    let!(:first_prospect) { FactoryBot.create(:prospect, created_at: Time.now - 1.day) }
    let!(:last_prospect) { FactoryBot.create(:prospect, created_at: Time.now + 1.day) }
    it "should sort prospect by created_at descending order" do
      expect(Prospect.first).to eq(last_prospect)
    end
  end
end