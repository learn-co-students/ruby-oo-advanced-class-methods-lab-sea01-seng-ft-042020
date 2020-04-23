require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all.push(self)
  end

  def self.create
    song = self.new
    all.push(song)
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    all.push(song)
    song
  end

  def self.find_by_name(name)
    all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    parsed_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = parsed_filename[1]
    song.artist_name = parsed_filename[0]
    song
  end

  def self.create_from_filename(filename)
    parsed_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = parsed_filename[1]
    song.artist_name = parsed_filename[0]
    all.push(song)
    song
  end

  def self.destroy_all
    all.clear
  end


end
