# frozen_string_literal: true

require 'pg'

# CRUD functionality relating to tags
class Tag
  attr_reader :tag, :bookmark_id

  def initialize(tag, bookmark_id)
    @tag = tag
    @bookmark_id = bookmark_id
  end

  def self.create(tag, bookmark_id)
    sql_query("
      INSERT INTO tags (tag, bookmark_id)
      VALUES('#{tag.downcase}', #{bookmark_id});
      ")
  end

  def self.where(bookmark_id)
    rslts = sql_query("
      SELECT * FROM tags
      WHERE bookmark_id = #{bookmark_id};
      ")
    rslts.map { |r| Tag.new(r['tag'], r['bookmark_id']) }
  end

  def self.delete(bookmark_id)
    sql_query("
      DELETE FROM tags
      WHERE bookmark_id = #{bookmark_id};
      ")
  end

  def self.find(tag, bookmark_id)
    rslt = sql_query("
      SELECT *
      FROM tags
      WHERE tag = '#{tag}'
      AND bookmark_id = #{bookmark_id};
      ")
    rslt.any?
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
