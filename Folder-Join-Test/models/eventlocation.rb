require 'pg'

class EventLocation
  attr_accessor(:locationid, :title, :location)

  #connect to the database
  def self.open_connection
    #PG is the class using gem 'pg'
    connection = PG.connect( dbname: 'locations')
  end

  # method to get all blog eventlocations
  def self.all
    connection = self.open_connection

    sql = "SELECT locationid, title, location FROM eventlocation ORDER BY locationid;"

    results = connection.exec(sql) #results is the pg object
    #map will loop through it and ..
    eventlocations = results.map do |eventlocation|
      self.hydrate(eventlocation)
    end

    # return array of eventlocation object
    eventlocations
  end

  def self.find(locationid)

    connection = self.open_connection

    sql = "SELECT * FROM eventlocation WHERE locationid = #{locationid} LIMIT 1"

    eventlocations = connection.exec(sql)

    eventlocation = self.hydrate(eventlocations[0])

    eventlocation

  end

  def self.hydrate(eventlocation_data) #use the parameter to pass the object
    #this substantiates a new eventlocation object
    #hydrate maps out the pg...(google)
    #eventlocation is already in the class but you are adding a method with the data from it
    eventlocation = EventLocation.new

    eventlocation.locationid = eventlocation_data['locationid']
    eventlocation.title = eventlocation_data['title']
    eventlocation.location = eventlocation_data['location']

    eventlocation
  end

  def save
    #this is saved in the database so if you rack it up again it will still be saved
    connection = EventLocation.open_connection
    #you use self because the values are inside the instance

    if(!self.locationid)
          sql = "INSERT INTO eventlocation (title, location) VALUES ('#{self.title}', '#{self.location}')"

    else
    sql = "UPDATE eventlocation SET title = '#{self.title}', location = '#{self.location}' WHERE locationid=('#{self.locationid}')"
    end
    connection.exec(sql)
  end

  def self.destroy(locationid)
    connection = eventlocation.open_connection

    sql = "DELETE FROM eventlocation WHERE locationid= #{locationid}"

    connection.exec(sql)


  end




end
