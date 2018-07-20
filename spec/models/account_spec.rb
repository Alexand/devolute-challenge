require 'spec_helper'

RSpec.describe Account do
  let(:account) { FactoryBot.build(:account) }

  context "account is valid" do
    it { expect(account).to be_valid }
  end

  describe "#validate_email" do
    context "email is null" do
      before { account.email = nil }
      it { expect(account).to_not be_valid }
    end

    context "email has less than 3 characters" do
      before { account.email = "foo" }
      it { expect(account).to_not be_valid }
    end

    context "email has weird format" do
      before { account.email = "foo@ bar. com" }
      it { expect(account).to_not be_valid }
    end

    context "email is not uniq" do
      before do
        account.save
        second_account.email = account.email
      end

      let(:second_account) { FactoryBot.build(:account) }

      it { expect(second_account).to_not be_valid }
    end
  end

  xit "is not valid without a name" do

  end

  describe "#validate_password" do
    context "password is null" do
      before { account.password = nil }
      it { expect(account).to_not be_valid }
    end

    context "password_confirmation is null" do
      before { account.password_confirmation = nil }
      it { expect(account).to_not be_valid }
    end

    context "password has less than 4 characters" do
      before { account.password = "fooo" }
      it { expect(account).to_not be_valid }
    end

    context "password and password_confirmation differ" do
      before { account.password += "-difference"}

      it { expect(account).to_not be_valid }
    end
  end

  describe "#crypted_password" do
    before { account.save }
    it { expect(account.crypted_password).to_not eq "password" }
  end
end
