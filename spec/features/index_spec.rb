feature 'homepage' do
  
  scenario 'should show a welcome message' do 
    visit '/'
    expect(page).to have_content('Bookmark Manager')
    expect(page).to have_button('Add Link')
  end

end
