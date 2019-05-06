require 'pg'

class Post
  attr_accessor(:id, :locationid, :title, :body)

  #connect to the database
  def self.open_connection
    #PG is the class using gem 'pg'
    connection = PG.connect( dbname: 'locations')
  end

  # method to get all blog posts
  def self.all
    connection = self.open_connection

    sql = "SELECT id, title, body FROM post ORDER BY id"

    results = connection.exec(sql) #results is the pg object
    #map will loop through it and ..
    posts = results.map do |post|
      self.hydrate(post)
    end

    # return array of post object
    posts
  end

  def self.find(id)

    connection = self.open_connection

    sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"

    posts = connection.exec(sql)

    post = self.hydrate(posts[0])

    post

  end

  def self.hydrate(post_data) #use the parameter to pass the object
    #this substantiates a new post object
    #hydrate maps out the pg...(google)
    #post is already in the class but you are adding a method with the data from it
    post = Post.new

    post.id = post_data['id']
    post.title = post_data['title']
    post.body = post_data['body']

    post
  end

  def save
    #this is saved in the database so if you rack it up again it will still be saved
    connection = Post.open_connection
    #you use self because the values are inside the instance

    if(!self.id)
          sql = "INSERT INTO post (title, body) VALUES ('#{self.title}', '#{self.body}')"
    else
    sql = "UPDATE post SET title = '#{self.title}', body = '#{self.body}' WHERE id=('#{self.id}')"
    end
    connection.exec(sql)
  end

  def self.destroy(id)
    connection = Post.open_connection

    sql = "DELETE FROM post WHERE id= #{id}"

    connection.exec(sql)


  end




end
