# frozen_string_literal: true

require 'pg'

def setup_test_database
  @connection = PG.connect(dbname: 'bookmark_manager_test')
  @connection.exec('TRUNCATE bookmarks, comments, tags, users CASCADE;')
end

def setup_user
  @connection.exec("
    INSERT INTO users
    VALUES(1, 'bookmark@manager.com', 'password');
  ")
end

def setup_bookmarks
  setup_user
  @connection.exec("
    INSERT INTO bookmarks
    VALUES(1, 'BBC', 'http://www.bbc.co.uk', 1);
  ")
end

def sign_up
  visit('/')
  within('#second-form') { fill_in('email', with: 'bookmark@manager.com') }
  within('#second-form') { fill_in('password', with: 'password') }
  within('#second-form') { click_button('sign up') }
end

def create_bookmark
  fill_in('title', with: 'BBC')
  fill_in('url', with: 'http://www.bbc.co.uk')
  click_button('add')
end

def create_tag
  fill_in('title', with: 'Channel 4')
  fill_in('url', with: 'http://www.channel4.com')
  click_button('add')
  first('.add-tag').click
  fill_in('tag', with: 'news')
  click_button('tag')
end
