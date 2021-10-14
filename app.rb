# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb:'/bookmarks/index'
  end

  get '/bookmarks/add' do 
    erb:'/bookmarks/add'
  end 

  post '/bookmarks' do
    Bookmark.add(url: params['url'], title: params['title'])
    redirect to ('/bookmarks')
  end

  run! if app_file == $PROGRAM_NAME
end

#continue from Returning a bookmark from Bookmark.create 
#in step 11 of Walkthrough