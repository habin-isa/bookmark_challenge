require 'sinatra/base'
require './lib/bookmark.rb'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
enable :sessions
register Sinatra::Flash

  get '/' do
    flash[:notice] = "Invalid url!" unless Bookmark.create(url: params['url'])
    @bookmarks = Bookmark.all
    erb(:index)
  end

  post '/create' do
    @url = params[:url]
    Bookmark.create(@url)
    redirect('/')
  end
  run! if app_file == $0
end
