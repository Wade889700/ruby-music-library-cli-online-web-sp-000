require 'pry'
class Artist
  extend Concerns::Findable
   attr_accessor :name, :songs
   @@all = []
   def initialize (name)
    @name = name
    @songs = []
  end
   def add_song (song)
    @songs << song unless @songs.include? song
    song.artist = self unless song.artist == self
  end
   def genres
    self.songs.map{|song| song.genre}.uniq
  end
   def self.all
    @@all
  end
   def self.destroy_all
    @@all = []
  end
   def save
    @@all << self
  end
  def self.create(name)
    self.new(name).tap do |artist|
      artist.save
    end
    #上面等同：(1)創建新實例：artist = Artist.new(name)
    #(2)儲存：artist.save
    #(3)回傳：artist
  end
end
