require ('pry')
require_relative('../models/artists.rb')
require_relative('../models/albums.rb')

artist = Artist.new('name' => 'The Beatles')
artist2 = Artist.new('name' => 'The Rolling Stones')
artist.save()
artist2.save()

album = Album.new('title' => "Revolver", "genre"  => "rock", "artist_id" => artist.id)
album2 = Album.new('title' => "Rubber Soul", "genre"  => "rock", "artist_id" => artist.id)
album3 = Album.new('title' => "Exile on Main St", "genre"  => "rock", "artist_id" => artist2.id)
album4 = Album.new('title' => "Fear of Cats", "genre"  => "rock", "artist_id" => artist2.id)
# album.save()
# album2.save()
# album3.save()
# album4.save()


# p Artist.all()
# p Album.all()

# p Album.find_by_artist(artist.id)
p Artist.find_by_album(album.id)



# artist2.delete()
#binding.pry
nil
