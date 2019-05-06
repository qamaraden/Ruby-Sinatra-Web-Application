class LocationController < Sinatra::Base

  # puts File.join(File.dirname(__FILE__), '..')

  # set the root of the parent directory of the current File, we've set this value to be the root
  set :root, File.join(File.dirname(__FILE__), '..')

  #sets the views directly correctly
  set :views, Proc.new { File.join(root, "views") }




  configure :development do
    register Sinatra::Reloader
  end



  get "/locations"  do

    @title = "Welcome to the blog"

    # @posts = $posts
    @locations = Location.all #this returns our array

    erb :'locations/index'

  end

  get "/location/new" do

      @location = Location.new

    erb :'locations/new'

  end

  post "/" do

    location = Location.new

    location.location = params[:location]
    location.body = params[:body]

    #save the post to the database
      location.save
      #this is going to be an instance method


    redirect "/locations"
  end

  get "/locations/:id" do
    id = params[:id].to_i

    # @post = $posts[id]
    @location = Location.find(id)

    erb :'locations/show'


  end

  get "/:id/edit2" do

    id = params[:id].to_i
    # @post = $posts[id]
    # @location = "Edit"
    @location = Location.find(id)

  erb :'locations/edit2'
  end

  put "/:id" do
    id = params[:id].to_i
    # post = $posts[id]
    location = Location.find(id)

    location.location = params[:location]
    location.body = params[:body]

    # $posts[id] = post
    location.save

    redirect "/locations"
  end

  delete "/:id" do
    id = params[:id].to_i
    Location.destroy(id)

    redirect '/locations'
  end


end
