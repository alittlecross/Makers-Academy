# frozen_string_literal: true

require 'tags'

describe Tag do
  describe '.create' do
    it 'creates a new tag' do
      setup_bookmarks

      Tag.create('news', 1)

      tags = @connection.exec("
        SELECT *
        FROM tags
        WHERE bookmark_id = '1';
      ")
      expect(tags.any?).to eq(true)
    end
  end
end
