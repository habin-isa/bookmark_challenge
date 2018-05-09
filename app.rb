require 'sinatra/base'
require './lib/bookmark.rb'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
enable :sessions
register Sinatra::Flash

  get '/' do
    puts flash[:notice]
    @bookmarks = Bookmark.all
    erb(:index)
  end

  post '/create' do
          Bookmark.create(params['url'])
          flash[:notice] = "You must submit a valid URL." if Bookmark.url_real(params['url']) == nil
          redirect '/'
  end


  run! if app_file == $0
end
