# frozen_string_literal: true
require 'pg'

feature 'Viewing My Bookmarks' do
  scenario 'view bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')
    expect(page).to have_content('My Bookmarks')
  end
  scenario 'view google bookmark' do
    visit('/bookmarks')
    expect(page).to have_content('www.google.com')
  end
end
