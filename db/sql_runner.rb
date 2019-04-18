require ('pg')

class SqlRunner

  def self.run(sql, values = []) # making it an array if given a second argument use it, if not just use the one
    begin
      db = PG.connect( { dbname: 'music_collection', host: 'localhost'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
      p sql
      p values
    ensure
      db.close() if db != nil #
    end
    return result

  end

end
