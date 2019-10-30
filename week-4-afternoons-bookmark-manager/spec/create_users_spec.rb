# frozen_string_literal: true

require 'users'

describe User do
  describe '.create' do
    it 'creates a new user' do
      User.create('bookmark@manager.com', 'password')

      users = @connection.exec("
        SELECT *
        FROM users
        WHERE email = 'bookmark@manager.com';
      ")

      expect(users.any?).to eq(true)
    end
  end

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
end
