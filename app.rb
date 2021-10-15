# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/bookmark'
require './database_connection_setup'
require 'uri'


class BookmarkManager < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions, :method_override

  get '/' do 
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb:'/bookmarks/index'
  end

  get '/bookmarks/add' do 
    erb:'/bookmarks/add'
  end 

  post '/bookmarks' do 
    flash[:notice] = "You must submit a valid URL." unless Bookmark.add(url: params['url'], title: params['title'])
    redirect to ('/bookmarks')
  end

  delete '/bookmarks/:id' do 
     Bookmark.delete(id: params['id'])
     redirect '/bookmarks'
  end 

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb:'/bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])  
    redirect('/bookmarks')
  end

  run! if app_file == $0
end

#continue from Returning a bookmark from Bookmark.create 
#in step 11 of Walkthrough