class PostController < Sinatra::Base

  # puts File.join(File.dirname(__FILE__), '..')

  # set the root of the parent directory of the current File, we've set this value to be the root
  set :root, File.join(File.dirname(__FILE__), '..')

  #sets the views directly correctly
  set :views, Proc.new { File.join(root, "views") }




  configure :development do
    register Sinatra::Reloader
  end




  get "/posts"  do

    @title = "Welcome to the blog"

    # @posts = $posts
    @posts = Post.all #this returns our array

    erb :'posts/index'



  end

  get "/post/new" do

      @post = Post.new

    erb :'posts/new'

  end

  post "/" do

    post = Post.new

    post.title = params[:title]
    post.body = params[:body]

    #save the post to the database
      post.save
      #this is going to be an instance method


    redirect "/posts"
  end

  get "/posts/:id" do
    id = params[:id].to_i

    # @post = $posts[id]
    @post = Post.find(id)

    erb :'posts/show'


  end

  get "/:id/edit" do

    id = params[:id].to_i
    # @post = $posts[id]
    # @title = "Edit"
    @post = Post.find(id)

  erb :'posts/edit'
  end

  put "/:id" do
    id = params[:id].to_i
    # post = $posts[id]
    post = Post.find(id)

    post.title = params[:title]
    post.body = params[:body]

    # $posts[id] = post
    post.save

    redirect "/posts"
  end

  delete "/:id" do
    id = params[:id].to_i
    Post.destroy(id)

    redirect '/posts'
  end


end
