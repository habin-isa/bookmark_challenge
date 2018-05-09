require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  post '/create' do
    @url = params[:url]
    Bookmark.create(@url)
    redirect('/')
  end



  run! if app_file == $0
end
