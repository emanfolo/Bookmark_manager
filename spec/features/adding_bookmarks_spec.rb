feature 'Adding bookmark' do
  scenario 'Add a bookmarks' do
    visit('/bookmarks/add')
    fill_in 'url' , with: 'http://www.gmail.com'
    fill_in 'title', with: 'gmail'
    click_button 'Submit'
    expect(page).to have_link('gmail', href: 'http://www.gmail.com')
    #recheck these tests as they are not failing no matter what
  end
end