require ('pry')
require_relative('../models/artists.rb')
require_relative('../models/albums.rb')

artist = Artist.new('name' => 'The Beatles')
artist2 = Artist.new('name' => 'The Rolling Stones')
artist.save()
artist2.save()

album = Album.new('title' => "Revolver", "genre"  => "rock", "artist_id" => "1")
album2 = Album.new('title' => "Rubber Soul", "genre"  => "rock", "artist_id" => "1")
album3 = Album.new('title' => "Exile on Main St", "genre"  => "rock", "artist_id" => "2")
album.save()
album2.save()
album3.save()


binding.pry
nil
