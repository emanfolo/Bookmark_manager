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

  feature 'a user can filter bookmarks by tag' do
    scenario 'adding the same tag to multiple bookmarks then filtering by tag' do
      Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      #Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      #Bookmark.add(url: 'http://www.google.com', title: 'Google')

      visit('/bookmarks')

      click_button 'Add Tag'
      
      fill_in 'tag', with: 'testing'
      click_button 'Submit'

      click_link 'testing'

      expect(page).to have_link 'Makers Academy', href: 'http://www.makersacademy.com'
      #expect(page).to have_link 'Destroy All Software',  href: 'http://www.destroyallsoftware.com'
      expect(page).not_to have_link 'Google', href: 'http://www.google.com'
    end
  end
end