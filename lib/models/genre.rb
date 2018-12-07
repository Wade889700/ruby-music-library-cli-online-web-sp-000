class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
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

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap do |genre|
      genre.save
    end
  end

  def songs
    @songs
  end


  def add_song(song)
    song.genre = self unless song.genre == self #將自身賦予給Song物件的實例(song)的genre特性。
    @songs << song unless @songs.include?(song) #再將這個Song物件的實例(song)加到Genre本身物件裡的@songs列表
  end


  def artists
    #a has many through
    @songs.collect {|song| song.artist}.uniq
  end
end
