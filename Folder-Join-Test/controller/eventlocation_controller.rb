class EventLocationController < Sinatra::Base

  # puts File.join(File.dirname(__FILE__), '..')

  # set the root of the parent directory of the current File, we've set this value to be the root
  set :root, File.join(File.dirname(__FILE__), '..')

  #sets the views directly correctly
  set :views, Proc.new { File.join(root, "views") }




  configure :development do
    register Sinatra::Reloader
  end




  get "/eventlocations"  do

    @title = "Welcome to the blog"

    # @posts = $posts
    @eventlocations = EventLocation.all #this returns our array

    erb :'eventlocations/index'



  end

  get "/eventlocation/new" do

      @eventlocation = EventLocation.new

    erb :'eventlocations/new'

  end

  post "/" do

    eventlocation = EventLocation.new

    eventlocation.title = params[:title]
    eventlocation.location = params[:location]

    #save the post to the database
      eventlocation.save
      #this is going to be an instance method


    redirect "/eventlocations"
  end

  get "/eventlocations/:locationid" do
    locationid = params[:locationid].to_i

    # @post = $posts[id]
    @eventlocation = EventLocation.find(locationid)

    erb :'eventlocations/show'


  end

  get "/:locationid/edit" do

    locationid = params[:locationid].to_i
    # @post = $posts[id]
    # @title = "Edit"
    @eventlocation = EventLocation.find(locationid)

  erb :'eventlocations/edit'
  end

  put "/:locationid" do
    locationid = params[:locationid].to_i
    # post = $posts[id]
    eventlocation = EventLocation.find(locationid)

    eventlocation.title = params[:title]
    eventlocation.location = params[:location]

    # $posts[id] = post
    eventlocation.save

    redirect "/eventlocations"
  end

  # delete "/:locationid" do
  #   locationid = params[:locationid].to_i
  #   Post.destroy(locationid)
  #
  #   redirect '/posts'
  # end


end
