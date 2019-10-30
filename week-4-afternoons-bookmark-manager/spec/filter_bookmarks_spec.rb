# frozen_string_literal: true

require 'bookmarks'

describe Bookmark do
  describe '.filter' do
    it 'returns a list of bookmarks filtered by tag' do
      setup_user
      @connection.exec("
        INSERT INTO bookmarks
        VALUES(1, 'BBC', 'http://www.bbc.co.uk', 1);
      ")
      @connection.exec("
        INSERT INTO bookmarks
        VALUES(2, 'Channel 4', 'http://www.channel4.com', 1);
      ")
      @connection.exec("
        INSERT INTO tags (tag, bookmark_id)
        VALUES('news', 2);
      ")

      bookmarks = Bookmark.filter(1, 'news')

      expect(bookmarks.length).to eq(1)
      expect(bookmarks.first.title).to eq('Channel 4')
    end
  end
end
