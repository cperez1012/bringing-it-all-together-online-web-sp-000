class Dog

  attr_accessor :name, :breed
  attr_reader :id

@@all = {}

  def initialize(id=nil, name:, breed:)
    @id = id
    @name = name
    @breed = breed
    @@all << self
  end

  def self.create_table

  end

  def self.drop_table

  end

  def save
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?)
      SQL

      DB[:conn].execute(sql, self.name, self.album)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
  end

  def self.create(name:, breed:)
    dog = self.new(name, album)
    dog.save
    dog
  end

  def self.new_from_db

  end

  def self.find_by_id(id)
    sql = "SELECT * FROM dogs WHERE id = ?"
    result = DB[:conn].execute(sql, id)[0]
    self.new(result[0], result[1], result[2])
  end

  def self.find_or_create_by(name:, breed:)
    dog = DB[:conn].execute("SELECT * FROM dogs WHERE name = ? AND breed = ?, name, breed")
    if !dog.empty?
      dog_data = dog[0]
      dog = self.new(song_data[0], dog_data[1], dog_data[2])
    else
      dog = self.create(name: name, breed: breed)
    end
    dog
  end

  def self.find_by_name(name)
    sql = "SELECT name FROM dogs WHEREE name =?"
    result = DB[:conn].execute(sql, name)[1]
    self.new(result[1])
  end

  def update
    sql = "UPDATE dogs SET name = ?, breed = ? WHERE ID = ?"
    DB[:conn].execute(sql, self.name, self.breed)
  end
end
