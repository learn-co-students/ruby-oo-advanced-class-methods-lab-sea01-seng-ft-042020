require "pry"
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    new_song = self.new 
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def save
    self.class.all << self
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|instance| instance.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    data = file.split(" - ")
    artist_name = data[0]
    song_name = data[1].split(".mp3")
    song = self.create
    song.name = song_name[0]
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    created = self.new_from_filename(file)
    created.save
    created
  end

  def self.destroy_all
    @@all = []
  end
end
