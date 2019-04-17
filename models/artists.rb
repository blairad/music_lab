require ('pg')
require_relative('albums.rb')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artist
    (
      name
    ) VALUES
    (
      $1
    )
    RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  #This is the original
  # def save()
  #   db = PG.connect({dbname: 'music_collection', host: 'localhost'})
  #   sql = "INSERT INTO artist
  #   (
  #     name
  #   ) VALUES
  #   (
  #     $1
  #   )
  #   RETURNING id;"
  #   values = [@name]
  #   db.prepare('save', sql)
  #   result = db.exec_prepared('save', values)
  #   db.close()
  #
  #   @id = result[0]['id'].to_i
  # end

  def self.all()
    sql = "SELECT * FROM artist"
    options = SqlRunner.run(sql)
    objects = options.map{|record| Artist.new(record)}
    # return options.map { |option| Artist.new(option)}
    return objects
  end

end
