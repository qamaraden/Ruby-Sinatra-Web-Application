require 'pg'

class Location
  attr_accessor(:id, :location, :body)

  #connect to the database
  def self.open_connection
    #PG is the class using gem 'pg'
    connection = PG.connect( dbname: 'locations')
  end

  # method to get all blog posts
  def self.all
    connection = self.open_connection

    sql = "SELECT id, location, body FROM location ORDER BY id"

    results = connection.exec(sql) #results is the pg object
    #map will loop through it and ..
    locations = results.map do |location|
      self.hydrate(location)
    end

    # return array of post object
    locations
  end

  def self.find(id)

    connection = self.open_connection

    sql = "SELECT * FROM location WHERE id = #{id} LIMIT 1"

    locations = connection.exec(sql)

    location = self.hydrate(locations[0])

    location

  end

  def self.hydrate(location_data) #use the parameter to pass the object
    #this substantiates a new post object
    #hydrate maps out the pg...(google)
    #post is already in the class but you are adding a method with the data from it
    location = Location.new

    location.id = location_data['id']
    location.location = location_data['location']
    location.body = location_data['body']

    location
  end

  def save
    #this is saved in the database so if you rack it up again it will still be saved
    connection = Location.open_connection
    #you use self because the values are inside the instance

    if(!self.id)
          sql = "INSERT INTO location (location, body) VALUES ('#{self.location}', '#{self.body}')"
    else
    sql = "UPDATE location SET location = '#{self.location}', body = '#{self.body}' WHERE id=('#{self.id}')"
    end
    connection.exec(sql)
  end

  def self.destroy(id)
    connection = Location.open_connection

    sql = "DELETE FROM location WHERE id= #{id}"

    connection.exec(sql)


  end




end
