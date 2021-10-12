# frozen_string_literal: true

require 'pg'

class Bookmark
  def initialize
    @bookmark_list = []
  end

  def all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec('select * from bookmarks')
    result.each { |bookmark| @bookmark_list << bookmark['url'] }
    @bookmark_list
  end
end
