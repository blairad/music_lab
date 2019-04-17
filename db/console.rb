require ('pry')
require_relative('../models/artists.rb')
require_relative('../models/albums.rb')

artist = Artist.new('name' => 'The Beatles')

artist.save()


binding.pry
nil
