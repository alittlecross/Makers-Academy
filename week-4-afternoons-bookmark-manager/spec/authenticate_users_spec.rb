# frozen_string_literal: true

require 'users'

describe User do
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
