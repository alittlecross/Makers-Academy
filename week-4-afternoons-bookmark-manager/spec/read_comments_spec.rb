# frozen_string_literal: true

require 'comments'

describe Comment do
  describe '.where' do
    it 'returns a list of comments for a specific bookmark' do
      setup_bookmarks
      @connection.exec("
        INSERT INTO comments (comment, bookmark_id)
        VALUES ('A news website.', 1);
      ")
      @connection.exec("
        INSERT INTO comments (comment, bookmark_id)
        VALUES ('Celebrity gossip.', 1);
      ")

      comments = Comment.where(1)

      expect(comments.length).to eq(2)
      expect(comments.first.comment).to eq('A news website.')
      expect(comments.last.comment).to eq('Celebrity gossip.')
    end
  end
end
