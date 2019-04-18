require ('pg')
require_relative('artists.rb')
require_relative('../db/sql_runner')

class Album

  attr_reader :id, :title, :genre, :artist_id

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @title = options['title']
      @genre = options['genre']
      @artist_id = options['artist_id']
    end

    def save
        sql = "INSERT INTO album
        (
          title,
          genre,
          artist_id
        ) VALUES
        (
          $1, $2, $3
        )
        RETURNING id;"
        values = [@title,@genre,@artist_id]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i
    end

    #This is the original
    # def save
    #     db = PG.connect( {dbname: 'music_collection', host: 'localhost'} )
    #     sql = "INSERT INTO album
    #     (
    #       title,
    #       genre,
    #       artist_id
    #     ) VALUES
    #     (
    #       $1, $2, $3
    #     )
    #     RETURNING id;"
    #     values = [@title,@genre,@artist_id]
    #     db.prepare('save', sql)
    #     result = db.exec_prepared('save', values)
    #     db.close
    #     @id = result[0]['id'].to_i
    # end

    # def self.find_by_artist(id)
    #   sql = "SELECT * FROM album WHERE artist_id =  $1"
    #   values = [@artist_id]
    #   results = SqlRunner.run(sql, values)
    #   find_hash = results.map { |result| Album.new(find_hash) }
    #   # binding.pry
    #   # album_list = Album.new(find_hash)
    #   binding.pry
    #   return find_hash
    #
    # end



    # def self.all()
    #   sql = "SELECT * FROM album"
    #   options = SqlRunner.run(sql)
    #   objects = options.map{|record| Album.new(record)}
    #   # return options.map { |option| Artist.new(option)}
    #   return objects
    # end

end
