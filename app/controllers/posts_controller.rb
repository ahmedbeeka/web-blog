class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    userid = session[:user_id]
    post = Post.new(params.require('post').permit('title', 'body'))
    post.user_id = userid
    post.save()
  end

  def new
    render :new
  end
end