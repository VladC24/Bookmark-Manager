require 'bookmark'
require 'database_helpers'

describe Bookmark do
  
  describe ".all" do
    it 'contains a list of bookmarks' do
  	  con = PG.connect(dbname: 'bookmark_manager_test')
      
      bookmark = Bookmark.create(url: "http://www.google.com", title: 'Google')
      Bookmark.create(url: "http://www.youtube.com", title: 'YouTube')

	    bookmarks = Bookmark.all

	    expect(bookmarks.length).to eq 2
	    expect(bookmarks.first).to be_a Bookmark
	    expect(bookmarks.first.id).to eq bookmark.id
	    expect(bookmarks.first.title).to eq 'Google'
	    expect(bookmarks.first.url).to eq 'http://www.google.com'
	  end
  end

  describe '.create' do
    it 'adds a new bookmark title to the database' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')

      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.url).to eq 'http://www.google.com'
      expect(bookmark.title).to eq 'Google'
    end
  end

end
 