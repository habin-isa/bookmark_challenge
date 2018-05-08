require 'bookmark'

describe Bookmark do
  describe 'prints list of bookmarks' do
    it 'uses all method to print the array' do
      expect(described_class.all).to eq ["http://huhmagazine.co.uk/", "https://hinge.co/", "www.deliveroo.com"]
    end
  end
end
