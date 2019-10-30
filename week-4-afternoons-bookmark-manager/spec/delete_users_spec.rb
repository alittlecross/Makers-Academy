# frozen_string_literal: true

require 'users'

describe User do
  describe '.sign_out' do
    it 'clears the current users details from the User instance' do
      user = User.create('bookmark@manager.com', 'password')

      user.sign_out

      expect(user.user_id).to eq(0)
    end
  end
end
