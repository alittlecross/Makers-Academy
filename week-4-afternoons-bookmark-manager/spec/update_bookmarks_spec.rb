# frozen_string_literal: true

require 'bookmarks'

describe Bookmark do
  describe '.update' do
    it 'changes an existing bookmark' do
      setup_user
      @connection.exec("
        INSERT INTO bookmarks
        VALUES(1, 'BBC', 'http://www.bbc.co.uk', 1);
      ")

      Bookmark.update(1, 'Channel 4', 'http://www.channel4.com')

      bookmarks = @connection.exec("
        SELECT *
        FROM bookmarks
        WHERE bookmark_id = 1;
      ")

      expect(bookmarks.any?).to eq(true)
    end
  end
end
