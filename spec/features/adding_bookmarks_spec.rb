feature 'Adding bookmark' do
  scenario 'Add a bookmarks' do
    visit('/bookmarks')
    fill_in "bookmark_url", with: 'http://www.gmail.com'
    click_button 'Submit'
    expect(page).to have_content('http://www.gmail.com')
  end
end