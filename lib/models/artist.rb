class Artist
  attr_accessor :name, :songs
  @@all=[]
  extend Findable

  def initialize(name)
    @name = name
    @songs=[]
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end

  def songs
    @songs
  end

  def genres
    @songs.collect do |song|
      song.genre
    end
    .uniq
  end

end
