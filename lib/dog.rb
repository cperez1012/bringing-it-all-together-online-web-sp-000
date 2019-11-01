class Dog

  attr_accessor :name, :breed
  attr_reader :id

  def initialize(id=nil, name, breed)
    @id = id
    @name = name
    @breed = breed
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

  def self.create

  end

  def self.new_from_db

  end

  def self.find_by_id

  end

  def self.find_or_create_by

  end

  def self.find_by_name

  end

  def update

  end
end
