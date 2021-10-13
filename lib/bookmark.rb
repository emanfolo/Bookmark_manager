# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end 
      result = connection.exec('select * from bookmarks')
      result.map { |bookmark| bookmark['url'] }
  end
end
