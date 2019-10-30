# frozen_string_literal: true

require 'comments'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      setup_bookmarks

      Comment.create('A news website.', 1)

      comments = @connection.exec("
        SELECT *
        FROM comments
        WHERE bookmark_id = '1';
      ")
      expect(comments.any?).to eq(true)
    end
  end
end
