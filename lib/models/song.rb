class Song

  attr_accessor :name,:artist, :genre
  @@all=[]

  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre  if genre
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

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def artist=(artist)
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end

  def artist
    @artist
  end

  def genre=(genre) # A reciprocal belong to 
    genre.songs<<self unless genre.songs.include?(self) #Tell genre thatit has a new song

    @genre = genre #Assign that genre to myself

  end

  def genre
    @genre
  end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end

  def self.new_from_filename(name)
    #parse the filename
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    #create song and assign artist and genre attribute, & create connections
    #prevent the creation of duplicate objects: songs, artists, genres
    #song = self.create(song_name)
    song = self.find_or_create_by_name(song_name)
    #song.artist = Artist.create(artist_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    #song.genre = Genre.create(genre_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end
end
