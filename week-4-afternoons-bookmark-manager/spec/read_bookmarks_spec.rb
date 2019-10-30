# frozen_string_literal: true

require 'bookmarks'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      setup_user
      @connection.exec("
        INSERT INTO bookmarks
        VALUES(1, 'BBC', 'http://www.bbc.co.uk', 1);
      ")

      bookmarks = Bookmark.all(1)

      expect(bookmarks.length).to eq(1)
      expect(bookmarks.first.title).to eq('BBC')
    end
  end

  describe '.find' do
    it 'returns a specific bookmark' do
      setup_user
      @connection.exec("
        INSERT INTO bookmarks
        VALUES(1, 'BBC', 'http://www.bbc.co.uk', 1);
      ")

      bookmark = Bookmark.find(1)

      expect(bookmark.title).to eq('BBC')
    end
  end
end
