require 'pg'

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

end
