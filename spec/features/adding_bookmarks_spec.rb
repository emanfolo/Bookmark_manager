feature 'Adding bookmark' do
  scenario 'Add a bookmarks' do
    visit('/bookmarks/add')
    fill_in 'url' , with: 'http://www.gmail.com'
    click_button 'Submit'
    
    expect(page).to have_content('http://www.gmail.com')
    #recheck these tests as they are not failing no matter what
  end
end