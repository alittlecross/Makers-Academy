# frozen_string_literal: true

require 'bcrypt'

# to differentiate between bookmark lists
class User
  attr_reader :user_id, :email

  def initialize(user_id, email)
    @user_id = user_id
    @email = email
  end

  def self.instance
    @user
  end

  def self.create(email, password)
    encrypted_password = BCrypt::Password.create(password)
    rslt = sql_query("
      INSERT INTO users (email, password)
      VALUES('#{email}', '#{encrypted_password}')
      RETURNING user_id, email;
      ").first
    @user = User.new(rslt['user_id'], rslt['email'])
  end

  def self.find(email)
    rslt = sql_query("
      SELECT *
      FROM users
      WHERE email = '#{email}';
      ")
    rslt.any?
  end

  def self.authenticate(email, password)
    rslt = sql_query("SELECT * FROM users WHERE email = '#{email}'").first
    return false unless BCrypt::Password.new(rslt['password']) == password

    @user = User.new(rslt['user_id'], rslt['email'])
  end

  def sign_out
    @user_id = 0
    @email = nil
  end

  def self.sql_query(query)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    connection.exec(query)
  end
end
