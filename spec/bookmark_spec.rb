require 'bookmark'

describe Bookmark do
  describe '#create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'https://www.google.com')
      expect(Bookmark.all).to include bookmark
    end
  end
end
