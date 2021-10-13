# frozen_string_literal: true
require 'pg'

feature 'Viewing My Bookmarks' do
  scenario 'view bookmarks' do
    Bookmark.add(url: "http://www.makersacademy.com")
    Bookmark.add(url: "http://www.destroyallsoftware.com")
    Bookmark.add(url: "http://www.google.com")
    visit('/bookmarks')
    expect(page).to have_content('http://www.makersacademy.com')
  end
end
