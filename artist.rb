class Artist
  attr_accessor :name
  @@all=[]

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

  def self.save
    @@all << self
  end

  def song
    @songs
  end

  def self.create(name)
   self.new(name).tap do|song|
     song.save
   end

  def add_song(song)
     song.artist = self
     @songs << song
  end

  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end

end
