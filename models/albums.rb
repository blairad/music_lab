require ('pg')
require_relative('artists.rb')

class Album

  attr_reader :id, :title, :genre, :artist_id

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @title = options['title']
      @genre = options['genre']
      @artist_id = options['artist_id']
    end

    def save
        db = PG.connect( {dbname: 'music_collection', host: 'localhost'} )
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
        db.prepare('save', sql)
        result = db.exec_prepared('save', values)
        db.close
        @id = result[0]['id'].to_i
    end

end
