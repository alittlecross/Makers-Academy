# frozen_string_literal: true

require 'bookmarks'

describe Bookmark do
  describe '.create' do
    it 'creates a new bookmark' do
      setup_user

      Bookmark.create('BBC', 'http://www.bbc.co.uk', 1)

      bookmarks = @connection.exec("
        SELECT *
        FROM bookmarks
        WHERE title = 'BBC';
      ")

      expect(bookmarks.any?).to eq(true)
    end
  end
end
