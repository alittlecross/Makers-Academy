# frozen_string_literal: true

require 'tags'

describe Tag do
  describe '.where' do
    it 'returns a list of tags for a specific bookmark' do
      setup_bookmarks
      @connection.exec("
        INSERT INTO tags (tag, bookmark_id)
        VALUES ('news', 1);
      ")

      tags = Tag.where(1)

      expect(tags.length).to eq(1)
      expect(tags.first.tag).to eq('news')
    end
  end

  describe '.find' do
    it 'checks if the tag exists for a specific bookmark' do
      setup_bookmarks
      @connection.exec("
        INSERT INTO tags (tag, bookmark_id)
        VALUES ('news', 1);
      ")

      expect(Tag.find('news', 1)).to eq(true)
      expect(Tag.find('news', 2)).to eq(false)
      expect(Tag.find('sport', 1)).to eq(false)
    end
  end
end
