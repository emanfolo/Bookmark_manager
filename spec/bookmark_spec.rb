# frozen_string_literal: true
require './lib/bookmark'
require 'database_helper'


describe Bookmark do

  let(:comment_class) { double(:comment_class) }
  let(:tag_class) { double(:tag_class) }

  describe '.all' do
    it 'returns a list of bookmarks' do
      #connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.add(url:'http://www.makersacademy.com', title:'makers academy')
      Bookmark.add(url:'http://www.destroyallsoftware.com', title:'destroy all software')
      Bookmark.add(url:'http://www.google.com',title: 'google')

      bookmarks = Bookmark.all

      expect(bookmarks[0].title).to include 'makers academy'
      expect(bookmarks[1].title).to include 'destroy all software'
      expect(bookmarks[2].title).to include 'google'
    end
  end

  describe '.add' do 
    it 'adds a new bookmark to the existing list of bookmarks' do 
      bookmark = Bookmark.add(url:"http://www.dailymail.com",title: "daily mail")
      persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks')
  
      expect(bookmark.title).to eq 'daily mail'
      expect(bookmark).to be_a Bookmark
      expect(bookmark.url).to eq 'http://www.dailymail.com'
      expect(bookmark.id).to eq persisted_data.first['id']
    end 

    it 'does not create a new bookmark if the URL is invalid' do 
      Bookmark.add(url: 'invalid bookmark', title: 'gmail')
      expect(Bookmark.all).to be_empty 
    end
  end

  describe '.delete' do 
    it 'deletes a given bookmark' do 
      bookmark = Bookmark.add(title: "Google", url: "http://www.Google.com")

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end 
  end 

  describe '.update' do 
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.MakersAcademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  describe '.find' do 
    it 'returns the requested bookmark object' do 
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      
      found = Bookmark.find(id: bookmark.id)

      expect(found).to be_a Bookmark 
      expect(found.id).to eq bookmark.id
      expect(found.title).to eq 'Makers Academy'
      expect(found.url).to eq 'http://www.makersacademy.com'
    end
  end

  

  describe '.comments' do 
    it 'returns a list of comments on a bookmark' do
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.comments(comment_class)
    end 
  end 

  describe '.tags' do
  it 'calls .where on the Tag class' do
    bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    expect(tag_class).to receive(:where).with(bookmark_id: bookmark.id)

    bookmark.tags(tag_class)
  end
end

end 
