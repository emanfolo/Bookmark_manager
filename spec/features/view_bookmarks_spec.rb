# frozen_string_literal: true
require 'pg'

feature 'Viewing My Bookmarks' do
  scenario 'view bookmarks' do
    Bookmark.add(url:"http://www.makersacademy.com", title:'makers academy')
    Bookmark.add(url:"http://www.destroyallsoftware.com", title:'destroy all software')
    Bookmark.add(url:"http://www.google.com", title:'google')
    visit('/bookmarks')
    expect(page).to have_link('makers academy', href: 'http://www.makersacademy.com')
  end
end
