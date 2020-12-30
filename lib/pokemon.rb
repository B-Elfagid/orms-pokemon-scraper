
class Pokemon

  attr_accessor :name, :type, :db
  attr_reader :id


def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
end 

def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
end 

def self.find(id, db)
    new_database = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    Pokemon.new(id: new_database[0], name: new_database[1], type: new_database[2], db: db)
end 

end