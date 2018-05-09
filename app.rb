require 'sinatra/base'
require './lib/bookmark.rb'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
enable :sessions
register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  post '/create' do
    @url = params[:url]
    Bookmark.create(@url)
    flash[:notice] = "Invalid url!"
    redirect('/')
  end



  run! if app_file == $0
end
