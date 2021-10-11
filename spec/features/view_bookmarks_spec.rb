feature 'Viewing My Bookmarks' do
  scenario 'view bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("My Bookmarks")
  end
  scenario 'view google bookmark' do
    visit('/bookmarks')
    expect(page).to have_content("www.google.com")
  end
end