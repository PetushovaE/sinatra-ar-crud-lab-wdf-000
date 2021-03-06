# require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  	configure do
    	set :public_folder, 'public'
    	set :views, 'app/views'
  	end

  	get '/' do 
      redirect to "/posts"
  	end

    get '/posts/new' do
      erb :new
    end

    post '/posts' do
      @post = Post.create(params)
      erb :posts
    end

    get '/posts' do
      @posts = Post.all 
      erb :index
    end
 	  

    get '/posts/:id' do  #load edit form
      @post = Post.find_by(id: params[:id])
      erb :show
    end

    get '/posts/:id/edit' do
      # post_id = params[:id]
      @post = Post.find_by(id: params[:id])
      erb :edit
    end

    patch '/posts/:id' do #edit action
      @post = Post.find_by(id: params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save

      erb :show
    end

  	delete '/posts/:id/delete' do #delete action
  	  @post = Post.find_by(id: params[:id])
  	  @post.delete

  	  erb :deleted
    end 
end