# frozen_string_literal: true

require 'pg'
require_relative './comments'
require_relative './tags'

# CRUD functionality relating to bookmarks
class Bookmark
  attr_reader :bookmark_id, :title, :url

  def initialize(bookmark_id, title, url)
    @bookmark_id = bookmark_id
    @title = title
    @url = url
  end

  def self.all(user_id)
    rslts = sql_query("
      SELECT *
      FROM bookmarks
      WHERE user_id = #{user_id};
      ")
    rslts.map { |r| Bookmark.new(r['bookmark_id'], r['title'], r['url']) }
  end

  def self.create(title, url, user_id)
    return false unless url?(url)

    sql_query("
      INSERT INTO bookmarks (title, url, user_id)
      VALUES('#{title}', '#{url}', #{user_id});
      ")
  end

  def self.find(bookmark_id)
    rslt = sql_query("
      SELECT *
      FROM bookmarks
      WHERE bookmark_id = #{bookmark_id};
      ").first
    Bookmark.new(rslt['bookmark_id'], rslt['title'], rslt['url'])
  end

  def self.update(bookmark_id, title, url)
    return false unless url?(url)

    sql_query("
      UPDATE bookmarks
      SET title = '#{title}', url = '#{url}'
      WHERE bookmark_id = #{bookmark_id};
      ")
  end

  def self.delete(bookmark_id)
    sql_query("
      DELETE FROM bookmarks
      WHERE bookmark_id = #{bookmark_id};
      ")
  end

  def self.filter(user_id, tag)
    rslts = sql_query("
      SELECT *
      FROM bookmarks
      INNER JOIN tags on bookmarks.bookmark_id=tags.bookmark_id
      WHERE user_id = #{user_id}
      AND tag = '#{tag}';
      ")
    rslts.map { |r| Bookmark.new(r['bookmark_id'], r['title'], r['url']) }
  end

  def comments
    Comment.where(bookmark_id)
  end

  def tags
    Tag.where(bookmark_id)
  end

  def self.sql_query(query)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    connection.exec(query)
  end

  def self.url?(url)
    url.include?('http://') || url.include?('https://')
  end
end
