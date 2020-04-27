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
    song = self.new
    @@all << song
    song
  end   

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song 
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    @@all.find do |song|
      song.name == title
    end
  end

  def self.find_or_create_by_name(title)
    
      if Song.find_by_name(title)
        return Song.find_by_name(title)
      else
        Song.create_by_name(title)
      end
  
  end
  
  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.file_conversion(filename)
    binding.pry
    file_converter = filename.split(" - ")
    file_converter_artist = file_converter[0]
    file_converter_song = file_converter[1].chomp('.mp3')
  end


  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end


  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    Song.all.clear
  end


end

