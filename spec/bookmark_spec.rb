# frozen_string_literal: true
require './lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.add('http://www.makersacademy.com', 'makers academy')
      Bookmark.add('http://www.destroyallsoftware.com', 'destroy all software')
      Bookmark.add('http://www.google.com', 'google')

      bookmarks = Bookmark.all

      expect(bookmarks[0].title).to include 'makers academy'
      expect(bookmarks[1].title).to include 'destroy all software'
      expect(bookmarks[2].title).to include 'google'
    end
  end

  describe '.add' do 
    it 'adds a new bookmark to the existing list of bookmarks' do 
      Bookmark.add("http://www.dailymail.com", "daily mail")
  
      expect(Bookmark.all[0].title).to include 'daily mail'
    end 
end
end 
