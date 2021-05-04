require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create valid user' do
      user = User.create(
        name: "samwise",
        email: "samwise@gmail.com",
        password: "I<3Frodo",
        password_confirmation: "I<3Frodo"
        )
      expect(user).to be_valid
    end

    it 'should confirm password' do
      user = User.create(
        name: "samwise",
        email: "samwise@gmail.com",
        password: "password",
        password_confirmation: "I<3Frodo"
        )
      expect(user).to_not be_valid
    end

    it 'should not save without unique email' do
      user = User.create(
        name: "samwise",
        email: "samwise@gmail.com",
        password: "I<3Frodo",
        password_confirmation: "I<3Frodo"
        )
        user2 = User.create(
        name: "samwise",
        email: "SAMWISE@gmail.com",
        password: "I<3Frodo",
        password_confirmation: "I<3Frodo"
        )
      expect(user2).to_not be_valid
    end

    it 'should not create password if passwords do not match' do
      user = User.create(
        name: "samwise",
        email: "samwise@gmail.com",
        password: "password",
        password_confirmation: "I<3Frodo"
        )
      expect(user).to_not be_equal(user.password_confirmation)
    end

    it 'password should have minimum length of 3' do
      user = User.create(
        name: "samwise",
        email: "samwise@gmail.com",
        password: "AB",
        password_confirmation: "AB"
        )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'user input password matches database' do
      user = User.create(
        name: "samwise",
        email: "samwise@gmail.com",
        password: "I<3Frodo",
        password_confirmation: "I<3Frodo"
        )
        authenticate = User.authenticate_with_credentials(user.email, user.password)
        expect(authenticate).to_not be_valid
    end
  end
end
