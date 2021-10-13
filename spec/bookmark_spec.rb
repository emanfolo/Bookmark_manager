# frozen_string_literal: true
require './lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks[0]).to include 'makersacademy.com'
      expect(bookmarks[1]).to include 'destroyallsoftware.com'
      expect(bookmarks[2]).to include 'http://www.google.com'
    end
  end

  describe '.add' do 
    it 'adds a new bookmark to the existing list of bookmarks' do 
      Bookmark.add("http://www.dailymail.com")
  
      expect(Bookmark.all).to include 'http://www.dailymail.com'
    end 
end
end 
