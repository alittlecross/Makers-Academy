# frozen_string_literal: true

require 'bookmarks'

describe Bookmark do
  describe '.delete' do
    it 'removes a specific bookmark' do
      setup_user
      @connection.exec("
        INSERT INTO bookmarks
        VALUES(1, 'BBC', 'http://www.bbc.co.uk', 1);
      ")

      Bookmark.delete(1)

      bookmarks = @connection.exec("
        SELECT *
        FROM bookmarks
        WHERE bookmark_id = 1;
      ")

      expect(bookmarks.any?).to eq(false)
    end
  end
end
