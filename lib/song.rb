require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      song = Song.find_by_name(name) 
      if song
        song
      else
        Song.create_by_name(name)
      end
        
  end

  # def song_array
  #   self.map {|song| song.name}
  # end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
    # binding.pry

    # Takes in filename and creates a song from it
  def self.new_from_filename(file_name)
    # formats the filename into an array [artist, song]
    song_info = file_name.chomp(".mp3").split(" - ")

    # finds or creates a song using the song info from above, stores in a var
    new_song = self.find_or_create_by_name(song_info[1])
    
    # stores the artist from song_info into the new song
    new_song.artist_name = song_info[0]

    new_song
    
  end

  def self.create_from_filename(file_name)
    # formats the filename into an array [artist, song]
    song_info = file_name.chomp(".mp3").split(" - ")

    # finds or creates a song using the song info from above, stores in a var
    new_song = self.find_or_create_by_name(song_info[1])

    # stores the artist from song_info into the new song
    new_song.artist_name = song_info[0]

    new_song
  end

  def self.destroy_all
    @@all.clear
  end
  



end

# binding.pry


