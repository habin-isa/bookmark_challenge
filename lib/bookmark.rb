require 'pg'
require 'uri'

class Bookmark

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname:'bookmark_manager_test')
      result = connection.exec("SELECT * FROM bookmarks")
      result.map { |bookmark| bookmark['url'] }
    else
      connection = PG.connect(dbname:'bookmark_manager')
      result = connection.exec("SELECT * FROM bookmarks")
      result.map { |bookmark| bookmark['url'] }
    end
  end

  def self.create(url)
    x = Bookmark.url_real(url)
    if x == nil
      false
    elsif ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname:'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
    else
      connection = PG.connect(dbname:'bookmark_manager')
      connection.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
    end
  end

  def self.url_real(url)
      url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
