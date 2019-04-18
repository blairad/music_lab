require ('pg')
require_relative('albums.rb')
require_relative('../db/sql_runner')

 class Artist
#
  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
  end
#
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
#
#   #This is the original
#   # def save()
#   #   db = PG.connect({dbname: 'music_collection', host: 'localhost'})
#   #   sql = "INSERT INTO artist
#   #   (
#   #     name
#   #   ) VALUES
#   #   (
#   #     $1
#   #   )
#   #   RETURNING id;"
#   #   values = [@name]
#   #   db.prepare('save', sql)
#   #   result = db.exec_prepared('save', values)
#   #   db.close()
#   #
#   #   @id = result[0]['id'].to_i
#   # end
#
#   # def delete()
#   #   sql = "DELETE FROM artist WHERE id = $1"
#   #   values = [@id]
#   #   SqlRunner.run(sql, values)
#   # end
#
  def self.find_by_album(id)
    sql = "SELECT * FROM album WHERE artist_id =  $1"
    results = []
    values = [id]
    result_album = SqlRunner.run(sql,["7"])
    result_album.each do |row|
          p 'got here'

           puts "%s %s" % [ row['id'], row['title'] ]
          # puts $row.to_yaml

        end


    # find_hash = results.map { |result| Artist.new(find_hash) }
    # binding.pry
    # return find_hash

  end
#
#   def self.all()
#     sql = "SELECT * FROM artist"
#     options = SqlRunner.run(sql)
#     return = options.map{|record| Artist.new(record)}
#     # return options.map { |option| Artist.new(option)}
#     # return objects
#   end
#
#


end
