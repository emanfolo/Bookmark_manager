# frozen_string_literal: true
require './lib/bookmark'
require 'database_helper'

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
      bookmark = Bookmark.add("http://www.dailymail.com", "daily mail")
      persisted_data = persisted_data(bookmark.id)
  
      expect(bookmark.title).to eq 'daily mail'
      expect(bookmark).to be_a Bookmark
      expect(bookmark.url).to eq 'http://www.dailymail.com'
      expect(bookmark.id).to eq persisted_data['id']
    end 
end
end 
