feature 'Adding bookmark' do
  scenario 'Add a bookmarks' do
    visit('/bookmarks/add')
    fill_in 'url' , with: 'http://www.gmail.com'
    fill_in 'title', with: 'gmail'
    click_button 'Submit'
    expect(page).to have_link('gmail', href: 'http://www.gmail.com')
  end

  scenario 'The bookmark must be a valid URL' do 
    visit('/bookmarks/add')
    fill_in 'url' , with: 'fake bookmark'
    fill_in 'title', with: 'gmail'
    click_button('Submit')

    expect(page).not_to have_content 'fake bookmark'
    expect(page).to have_content 'You must submit a valid URL.'
  end 
end