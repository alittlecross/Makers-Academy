# frozen_string_literal: true

require 'pg'

# CRUD functionality relating to comments
class Comment
  attr_reader :comment_id, :comment, :bookmark_id

  def initialize(comment_id, comment, bookmark_id)
    @comment_id = comment_id
    @comment = comment
    @bookmark_id = bookmark_id
  end

  def self.create(comment, bookmark_id)
    sql_query("
      INSERT INTO comments (comment, bookmark_id)
      VALUES ('#{comment}', #{bookmark_id});
      ")
  end

  def self.where(bookmark_id)
    rslts = sql_query("
      SELECT *
      FROM comments
      WHERE bookmark_id = #{bookmark_id};
      ")
    rslts.map do |r|
      Comment.new(r['comment_id'], r['comment'], r['bookmark_id'])
    end
  end

  def self.delete(bookmark_id)
    sql_query("
      DELETE FROM comments
      WHERE bookmark_id = #{bookmark_id};
      ")
  end

  def self.sql_query(query)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    connection.exec(query)
  end
end
