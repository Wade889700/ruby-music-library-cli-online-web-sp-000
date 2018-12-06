class Genre
  attr_accessor :name
  @@all=[]

  def initialize(name)
    @name = name
    @songs=[]
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self
    @songs << song
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

  def self.create(name)
   self.new(name).tap do|song|
     song.save
   end

   def artists
     artists = @songs.collect do |song|
       song.artist
     end
     artists.uniq
   end

   def self.find_by_name(name)
    @@all.find do |song|
        song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
