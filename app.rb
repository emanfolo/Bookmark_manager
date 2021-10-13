# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmark = Bookmark
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    @bookmark.add(params[:bookmark_url])
    redirect to ('/bookmarks')
  end

  run! if app_file == $PROGRAM_NAME
end
