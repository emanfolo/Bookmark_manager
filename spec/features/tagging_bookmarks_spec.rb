feature 'Adding and viewing tags' do
  feature 'a user can add and then view a tag' do
    scenario 'a comment is added to a bookmark' do
      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')

      visit '/bookmarks'
      click_button 'Add Tag'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"

      fill_in 'tag', with: 'test tag'
      click_button 'Submit'

      expect(current_path).to eq '/bookmarks'
      expect(page).to have_content 'test tag'
    end
  end
end