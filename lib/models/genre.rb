require 'pry'
class Genre
  extend Concerns::Findable
   attr_accessor :name, :songs, :genre
   @@all = []
   def initialize (name)
    @name = name
    @songs = []
  end
   def artists
    self.songs.map{|song| song.artist}.uniq
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
    self.new(name).tap do |genre|
      genre.save
    end
  end
end
