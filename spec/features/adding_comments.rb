feature 'Adding and viewing comments' do 
  feature 'a user can add and then view a comment' do 
    scenario 'a comment is added to a bookmark' do 
      bookmark = Bookmark.add(url: 'http://google.com', title: 'Google')

      visit '/bookmarks'
      click_button 'Add Comment'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

      fill_in 'comment', with 'This comment is a test'
      click_button 'Submit'

      expect(current_path).to eq '/bookmarks'
      expect(page).to have_content 'This comment is a test'
    end 
  end 
end 