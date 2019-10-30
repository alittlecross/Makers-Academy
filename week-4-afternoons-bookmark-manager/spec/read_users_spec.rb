# frozen_string_literal: true

require 'users'

describe User do
  describe '.find' do
    it 'checks if an account with that email already exists' do
      @connection.exec("
        INSERT INTO users (email, password)
        VALUES('bookmark@manager.com', 'password');
      ")

      expect(User.find('bookmark@manager.com')).to eq(true)
      expect(User.find('manage@bookmarks.com')).to eq(false)
    end
  end

  describe '.authenticate' do
    it 'checks the sign in password matches the sign up password' do
      encrypted_password = BCrypt::Password.create('password')
      @connection.exec("
        INSERT INTO users (email, password)
        VALUES('bookmark@manager.com', '#{encrypted_password}');
      ")

      user = User.authenticate('bookmark@manager.com', 'password')

      expect(user.email).to eq('bookmark@manager.com')
    end
  end
end
