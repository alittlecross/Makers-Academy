# frozen_string_literal: true

# rubocop:disable Style/NumericPredicate

require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/users'
require_relative './lib/bookmarks'
require_relative './lib/comments'
require_relative './lib/tags'

# the controller
class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  before do
    @user = User.instance
  end

  get '/' do
    erb :index
  end

  post '/sign_in' do
    email = params[:email]
    password = params[:password]
    if !User.find(email)
      flash[:sign_in] = 'There is no account with that email.'
      redirect '/'
    elsif !User.authenticate(email, password)
      flash[:sign_in] = 'Password incorrect.'
      redirect '/'
    else
      redirect '/bookmarks'
    end
  end

  post '/sign_up' do
    email = params[:email]
    password = params[:password]
    if User.find(email)
      flash[:sign_up] = 'There is already an account with that email.'
      redirect '/'
    else
      User.create(email, password)
      redirect '/bookmarks'
    end
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all(@user.user_id)
    erb :bookmarks
  end

  post '/create' do
    title = params[:title]
    url = params[:url]
    user_id = @user.user_id
    message = 'You must enter a valid url.'
    redirect '/' if @user.user_id == 0
    flash[:create] = message unless Bookmark.create(title, url, user_id)
    redirect '/bookmarks'
  end

  get '/:update/update' do
    redirect '/' if @user.user_id == 0
    @bookmark = Bookmark.find(params[:update])
    erb :update
  end

  post '/make_update' do
    if Bookmark.url?(params[:url])
      Bookmark.update(params[:bookmark_id], params[:title], params[:url])
      redirect '/bookmarks'
    else
      flash[:update] = 'You must enter a valid url.'
      redirect "/#{params[:bookmark_id]}/update"
    end
  end

  get '/:bookmark_id/delete' do
    redirect '/' if @user.user_id == 0
    Comment.delete(params[:bookmark_id])
    Tag.delete(params[:bookmark_id])
    Bookmark.delete(params[:bookmark_id])
    redirect '/bookmarks'
  end

  get '/:bookmark_id/comment' do
    redirect '/' if @user.user_id == 0
    @bookmark = Bookmark.find(params[:bookmark_id])
    erb :comment
  end

  post '/make_comment' do
    Comment.create(params[:comment], params[:bookmark_id])
    redirect '/bookmarks'
  end

  get '/:bookmark_id/tag' do
    redirect '/' if @user.user_id == 0
    @bookmark = Bookmark.find(params[:bookmark_id])
    erb :tag
  end

  post '/make_tag' do
    tag = params[:tag]
    bookmark_id = params[:bookmark_id]
    Tag.create(tag, bookmark_id) unless Tag.find(tag, bookmark_id)
    redirect '/bookmarks'
  end

  get '/:tag/filter' do
    redirect '/' if @user.user_id == 0
    @filter = Bookmark.filter(@user.user_id, params[:tag])
    erb :filter
  end

  get '/sign_out' do
    session.clear
    @user.sign_out
    flash[:sign_out] = 'You have signed out.'
    redirect '/'
  end
end

# rubocop:enable Style/NumericPredicate
