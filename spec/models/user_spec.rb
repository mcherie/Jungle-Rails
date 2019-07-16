require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do

    # it { is_expected.to validate_presence_of(:first_name) }
    # it { is_expected.to validate_presence_of(:last_name) }
    # it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_presence_of(:password) } 
    # it { is_expected.to validate_presence_of(:confirm_password) }

    it "is valid without all the credentials filled out" do
        user = User.new(
          first_name: "Ann",
          last_name: "Smith",
          email: "Ann@smith.com",
          password: "ann123",
          password_confirmation: "ann123"
        )
        expect(user).to be_valid
    end

    it "is not valid without a first_name" do
        user = User.new(
          first_name: "",
          last_name: "Smith",
          email: "Ann@smith.com",
          password: "ann123",
          password_confirmation: "ann123"
        )
        expect(user).not_to be_valid
    end

    it "is not valid without a last_name" do
        user = User.new(
          first_name: "Ann",
          last_name: nil,
          email: "Ann@smith.com",
          password: "ann123",
          password_confirmation: "ann123"
        )
        expect(user).not_to be_valid
    end

    it "is not valid without an email" do
        user = User.new(
          first_name: "Ann",
          last_name: "Smith",
          email: nil,
          password: "ann123",
          password_confirmation: "ann123"
        )
        expect(user).not_to be_valid
    end

    it "is valid with an email with spaces" do
        user = User.new(
          first_name: "Ann",
          last_name: "Smith",
          email: "   Ann@smith.com    ",
          password: "ann123",
          password_confirmation: "ann123"
        )
        expect(user).to be_valid
    end

    it "is not valid without a password" do
        user = User.new(
          first_name: "Ann",
          last_name: "Smith",
          email: "Ann@smith.com",
          password: nil,
          password_confirmation: "ann123"
        )
        expect(user).not_to be_valid
    end

    it "is not valid without a confirmation_password" do
        user = User.new(
          first_name: "Ann",
          last_name: "Smith",
          email: "Ann@smith.com",
          password: "ann123",
          password_confirmation: nil
        )
        expect(user).not_to be_valid
    end

    it "is not valid with a password confirmation mismatch" do
        user = User.new(
          first_name: "Ann",
          last_name: "Smith",
          email: "Ann@smith.com",
          password: "ann123",
          password_confirmation: "ann123456"
        )
        expect(user).not_to be_valid
    end

    it "is not valid with a short password" do
        user = User.new(
          first_name: "Ann",
          last_name: "Smith",
          email: "Ann@smith.com",
          password: "ann",
          password_confirmation: "ann"
        )
        expect(user).not_to be_valid
    end


    
    it "is not valid with a duplicate non-case sensitive email" do
        user1 = User.create!(
          first_name: "Ann",
          last_name: "Smith",
          email: "Ann@smith.com",
          password: "ann123",
          password_confirmation: "ann123"
        )
        user2 = User.new(
          first_name: "Jone",
          last_name: "Jane",
          email: "ann@smith.com",
          password: "ann123X",
          password_confirmation: "ann123X"
        )
      expect(user2).not_to be_valid
    end

  end


  describe '.authenticate_with_credentials' do

    before do
      # Create user
      user = User.create!(
        first_name: "Ann",
        last_name: "Ban",
        email: "    NAA@naa.com    ",
        password: "naa123",
        password_confirmation: "naa123"
      )

      # Make sure, we created user is valid for further validation.
      expect(user).to be_valid
    end

    it "authenticated user is valid | positive" do
      fakeUser = User.authenticate_with_credentials("naa@naa.com", "naa123")

      # NOT nil
      expect(fakeUser).not_to be_nil
    end

    it "authenticated user is not valid with wrong password | negative" do
      fakeUser = User.authenticate_with_credentials("naa@naa.com", "naa1234")

      expect(fakeUser).to be_nil
    end

    it "authenticated user is not valid with no email | negative" do
      fakeUser = User.authenticate_with_credentials(nil, "naa1234")

      expect(fakeUser).to be_nil
    end

    it "authenticated user is not valid with no password | negative" do
      fakeUser = User.authenticate_with_credentials("naa@naa.com", nil)

      expect(fakeUser).to be_nil
    end

    it "authenticated user is not valid with no credentials | negative" do
      fakeUser = User.authenticate_with_credentials(nil, nil)

      expect(fakeUser).to be_nil
    end

    it "authenticated user is valid with space in email | positive" do
      fakeUser = User.authenticate_with_credentials("    naa@naa.com     ", "naa123")

      # NOT nil
      expect(fakeUser).not_to be_nil
    end

    it "authenticated user is valid with uppercase email | positive" do
      fakeUser = User.authenticate_with_credentials("NAA@naa.com", "naa123")

      # NOT nil
      expect(fakeUser).not_to be_nil
    end

    it "authenticated user is valid with uppercase domain name | positive" do
      fakeUser = User.authenticate_with_credentials("nAa@NAA.com", "naa123")

      # NOT nil
      expect(fakeUser).not_to be_nil
    end
  end
end
 
