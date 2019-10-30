# frozen_string_literal: true

require 'tags'

describe Tag do
  describe '.delete' do
    it 'removes all tags for a specific bookmark' do
      setup_bookmarks
      @connection.exec("
        INSERT INTO tags (tag, bookmark_id)
        VALUES ('news', 1);
      ")

      Tag.delete(1)

      comments = @connection.exec("
        SELECT *
        FROM comments
        WHERE bookmark_id = '1';
      ")

      expect(comments.any?).to eq(false)
    end
  end
end
