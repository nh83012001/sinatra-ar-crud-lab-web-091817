require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts' do #index ction
    @posts = Post.all

    erb :index
  end

  get '/posts/new' do #new action
    erb :new
  end

  post '/posts' do # new action
    @post = Post.create(name: params[:name],content: params[:content])
    redirect to "/posts"
  end

  get '/posts/:id' do #show action
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do  #load edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #edit action
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do #delete action
    @post = Post.find(params[:id])
    @post.delete
    erb :deleted
  end

end
