feature 'viewing bookmarks' do
  scenario 'see all the bookmarks' do 
    Bookmark.create(url: "http://www.google.com", title: 'Google')

    visit('/bookmarks')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
