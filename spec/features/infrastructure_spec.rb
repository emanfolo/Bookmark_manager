feature 'Testing Infrastructure' do
  scenario 'Homepage' do
    visit('/')
    expect(page).to have_content("Hello World!")
  end
end