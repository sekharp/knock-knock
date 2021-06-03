require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "creation" do
    let!(:user) { FactoryBot.create(:user) }
    it "can be created" do
      expect(user).to be_valid
    end
  end

  describe "validations" do
    let(:user) { FactoryBot.build(:user) }
    let(:duplicate_user) { FactoryBot.build(:user) }

    it "requires email address" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "requires unique email address" do
      user.save!
      duplicate_user.email = user.email
      expect(duplicate_user).to_not be_valid
    end

    it "requires a password" do
      user.password = nil
      expect(user).to_not be_valid
    end        
  end

  describe "prospect associations" do
    let!(:user_with_prospects) { FactoryBot.create(:user_with_prospects) }

    it "has many prospects" do
      relation = described_class.reflect_on_association(:prospects)
      expect(relation.macro).to eq(:has_many)
    end

    it "destroys associated prospects" do
      expect{ user_with_prospects.destroy }.to change { Prospect.count }.by(-5)
    end
  end

end