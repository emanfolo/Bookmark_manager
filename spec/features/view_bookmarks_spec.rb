# frozen_string_literal: true
require 'pg'

feature 'Viewing My Bookmarks' do
  scenario 'view bookmarks' do
    Bookmark.add("http://www.makersacademy.com", 'makers academy')
    Bookmark.add("http://www.destroyallsoftware.com", 'destroy all software')
    Bookmark.add("http://www.google.com", 'google')
    visit('/bookmarks')
    expect(page).to have_link('makers academy', href: 'http://www.makersacademy.com')
  end
end
