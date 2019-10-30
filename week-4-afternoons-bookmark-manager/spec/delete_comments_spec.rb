# frozen_string_literal: true

require 'comments'

describe Comment do
  describe '.delete' do
    it 'removes all comments for a specific bookmark' do
      setup_bookmarks
      @connection.exec("
        INSERT INTO comments (comment, bookmark_id)
        VALUES ('A news website.', 1);
      ")

      Comment.delete(1)

      comments = @connection.exec("
        SELECT *
        FROM comments
        WHERE bookmark_id = '1';
      ")
      expect(comments.any?).to eq(false)
    end
  end
end
