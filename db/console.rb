require ('pry')
require_relative('../models/artists.rb')
require_relative('../models/albums.rb')

artist = Artist.new('name' => 'The Beatles')
album = Album.new('title' => "Revolver", "genre"  => "rock", "artist_id" => "1")

artist.save()
album.save()


binding.pry
nil
