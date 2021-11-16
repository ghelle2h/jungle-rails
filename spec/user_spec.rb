require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'saves user when all fields are filled out' do
      user = User.new(
        name: 'Hamza',
        email: 'hamzaemail@gmail.com',
        password: 'password', 
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'wont save user when password is nil' do
      user = User.new(
        name: 'Hamza',
        email: 'hamzaemail@gmail.com',
        password: nil, 
        password_confirmation: nil
      )
      expect(user).to be_invalid
    end

    it 'wont save user when password is nil' do
      user = User.new(
        name: nil,
        email: 'hamzaemail@gmail.com',
        password: 'password', 
        password_confirmation: 'password'
      )
      expect(user).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should authenticate with valid credentials' do
      user = User.new(
        name: 'Hamza',
        email: 'hamzaemail@gmail.com',
        password: 'password', 
        password_confirmation: 'password'
      )
    user.save

    user = User.authenticate_with_credentials('hamzaemail@gmail.com', 'password') 
    expect(user).not_to be(nil)
    end
    it 'should fail if invalid credentials are entered' do 
      user = User.new(
        name: 'Hamza',
        email: 'hamzaemail@gmail.com',
        password: 'password', 
        password_confirmation: 'password'
      )
    user.save

    user = User.authenticate_with_credentials('hamzaemail@gmail.com', 'pass')
    end

    it 'should pass if email case is capital' do 
      user = User.new(
        name: 'Hamza',
        email: 'hamzaemail@gmail.com',
        password: 'password', 
        password_confirmation: 'password'
      )
    user.save

    user = User.authenticate_with_credentials('HAMZAEMAIL@gmail.com', 'password')
    expect(user).not_to be(nil)
    end
    it 'should pass if there are spaces after the email' do 
      user = User.new(
        name: 'Hamza',
        email: 'hamzaemail@gmail.com',
        password: 'password', 
        password_confirmation: 'password'
      )
    user.save

    user = User.authenticate_with_credentials('hamzaemail@gmail.com   ', 'password')
    expect(user).not_to be(nil)
    end
  end

end